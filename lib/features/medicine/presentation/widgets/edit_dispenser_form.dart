import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pill/core/helpers/date_time_formatter.dart';

import 'package:smart_pill/core/presentation/widgets/custom_button.dart';
import 'package:smart_pill/core/presentation/widgets/custom_input_card.dart';
import 'package:smart_pill/core/presentation/widgets/custom_progress_indicator.dart';
import 'package:smart_pill/core/resources/colors.dart';
import 'package:smart_pill/core/resources/values.dart';
import 'package:smart_pill/core/services/service_locator.dart';
import 'package:smart_pill/core/utils/enums.dart';
import 'package:smart_pill/core/utils/extensions.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';
import 'package:smart_pill/features/medicine/presentation/controller/dispenser_form/cubit/dispenser_form_cubit.dart';
import 'package:smart_pill/features/medicine/presentation/controller/new_dispenser/bloc/new_dispenser_bloc.dart';
import 'package:smart_pill/features/notifications/presentation/controller/bloc/notification_bloc.dart';

class EditDispenserForm extends StatelessWidget {
  const EditDispenserForm({
    super.key,
    required this.dispenser,
  });
  final Dispenser dispenser;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<DispenserFormCubit>()),
        BlocProvider(create: (context) => sl<NewDispenserBloc>()),
        BlocProvider(create: (context) => sl<NotificationBloc>())
      ],
      child: BlocListener<NewDispenserBloc, NewDispenserState>(
        listener: (context, state) {
          if (state.status == RequestStatus.success) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<DispenserFormCubit, DispenserFormState>(
          builder: (context, dispenserState) {
            return BlocBuilder<NewDispenserBloc, NewDispenserState>(
                builder: (context, newDispenserState) {
              final NewDispenserBloc addPatientBloc =
                  context.read<NewDispenserBloc>();
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _dragLable(),
                  _medicineNameTextField(context),
                  Row(
                    children: [
                      _indexTextField(context),
                      Expanded(child: _doseCounter(context)),
                    ],
                  ),
                  _scheduleTextField(context),
                  addPatientBloc.state.status == RequestStatus.loading
                      ? const CustomProgressIndicator()
                      : _deleteDispenserButton(context),
                ],
              );
            });
          },
        ),
      ),
    );
  }

  Center _dragLable() {
    return Center(
      child: Container(
        width: AppWidth.w48.w,
        height: AppHeight.h4.h,
        margin: const EdgeInsets.only(top: 14).w,
        decoration: BoxDecoration(
          color: AppColors.divider.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10).r,
        ),
      ),
    );
  }

  CustomInputCard _medicineNameTextField(BuildContext context) {
    return CustomInputCard(
      label: 'Medicine Name',
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0).w,
      content: Padding(
        padding: const EdgeInsets.all(12.0).w,
        child: Text(dispenser.medicine),
      ),
      leading: Container(
        padding: const EdgeInsets.all(AppPadding.p14).w,
        child: ImageIcon(AssetImage(dispenser.type.icon),
            size: 10.h, color: AppColors.primary),
      ),
    );
  }

  CustomInputCard _indexTextField(BuildContext context) {
    return CustomInputCard(
      width: AppWidth.w72,
      label: 'Index',
      margin: const EdgeInsets.fromLTRB(16, 8, 8, 8).w,
      content: Padding(
        padding: const EdgeInsets.all(12.0).w,
        child: Text(dispenser.index, textAlign: TextAlign.center),
      ),
    );
  }

  CustomInputCard _doseCounter(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String type = dispenser.type.name;
    return CustomInputCard(
      label: 'Dose',
      margin: const EdgeInsets.fromLTRB(8, 8, 16, 8).w,
      content: Center(
          child: Text('${dispenser.dose} $type', style: textTheme.bodyMedium)),
    );
  }

  CustomInputCard _scheduleTextField(BuildContext context) {
    final String weekdayName =
        DateTimeFormatter.getWeekDayName(dispenser.schedule.days.first);
    return CustomInputCard(
      label: 'Schedule',
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0).w,
      content: Padding(
        padding: const EdgeInsets.all(12.0).w,
        child: Text('$weekdayName  at  ${dispenser.schedule.times.first}'),
      ),
      leading: Container(
        padding: const EdgeInsets.all(AppPadding.p14).w,
        child: Icon(Icons.access_time, size: 20.h, color: AppColors.primary),
      ),
    );
  }

  CustomButton _deleteDispenserButton(BuildContext context) {
    final notificationBloc = context.read<NotificationBloc>();
    final NewDispenserBloc newDispenserBloc = context.read<NewDispenserBloc>();
    return CustomButton(
      height: AppHeight.h40.h,
      lable: 'Delete Dispenser',
      margin: AppMargin.medium.w,
      backgroundColor: Colors.red,
      onTap: () {
        notificationBloc.add(
            NotificationCanceled(notificationId: int.parse(dispenser.index)));
        newDispenserBloc.add(DispenserDeleted(
            dispenserId: dispenser.id, index: dispenser.index));
      },
    );
  }
}
