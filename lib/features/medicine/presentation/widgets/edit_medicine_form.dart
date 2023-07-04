import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/helpers/date_time_formatter.dart';

import 'package:med_alert/core/presentation/widgets/custom_button.dart';
import 'package:med_alert/core/presentation/widgets/custom_input_card.dart';
import 'package:med_alert/core/presentation/widgets/custom_progress_indicator.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/values.dart';
import 'package:med_alert/core/services/service_locator.dart';
import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/core/utils/extensions.dart';
import 'package:med_alert/features/medicine/domain/entities/medicine_schedule.dart';
import 'package:med_alert/features/medicine/presentation/controller/medicine_form/cubit/medicine_form_cubit.dart';
import 'package:med_alert/features/medicine/presentation/controller/medicine_schedule/bloc/medicine_schedule_bloc.dart';
import 'package:med_alert/features/notifications/presentation/controller/bloc/notification_bloc.dart';

class EditDispenserForm extends StatelessWidget {
  const EditDispenserForm({
    super.key,
    required this.medicine,
    required this.index,
  });
  final MedicineSchedule medicine;
  final int index;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<MedicineFormCubit>()),
        BlocProvider(create: (context) => sl<MedicineScheduleBloc>()),
        BlocProvider(create: (context) => sl<NotificationBloc>())
      ],
      child: BlocListener<MedicineScheduleBloc, MedicineScheduleState>(
        listener: (context, state) {
          if (state.status == RequestStatus.success) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<MedicineFormCubit, MedicineFormState>(
          builder: (context, medicineFormState) {
            return BlocBuilder<MedicineScheduleBloc, MedicineScheduleState>(
                builder: (context, medicineScheduleState) {
              final MedicineScheduleBloc addPatientBloc =
                  context.read<MedicineScheduleBloc>();
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _dragLable(),
                  Row(
                    children: [
                      _medicineNameTextField(context),
                      Flexible(child: _doseCounter(context)),
                    ],
                  ),
                  _scheduleTextField(context),
                  _timesTextField(context),
                  addPatientBloc.state.status == RequestStatus.loading
                      ? const CustomProgressIndicator()
                      : _deleteMedicineScheduleButton(context),
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
      width: AppWidth.w200.w,
      content: Padding(
        padding: const EdgeInsets.all(12.0).w,
        child: Text(medicine.medicine),
      ),
      leading: Container(
        padding: const EdgeInsets.all(AppPadding.p14).w,
        child: ImageIcon(AssetImage(medicine.type.icon),
            size: 10.h, color: AppColors.primary),
      ),
    );
  }

  CustomInputCard _doseCounter(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String type = medicine.type.name;
    return CustomInputCard(
      label: 'Dose',
      margin: const EdgeInsets.fromLTRB(8, 8, 16, 8).w,
      content: Center(
          child: Text('${medicine.dose} $type', style: textTheme.bodyMedium)),
    );
  }

  CustomInputCard _scheduleTextField(BuildContext context) {
    final String weekdayName =
        DateTimeFormatter.getWeekDayNames(medicine.schedule.days);
    return CustomInputCard(
      label: 'Schedule',
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0).w,
      content: Padding(
        padding: const EdgeInsets.all(12.0).w,
        child: Text(weekdayName),
      ),
      leading: Container(
        padding: const EdgeInsets.all(AppPadding.p14).w,
        child: Icon(Icons.calendar_month_outlined,
            size: 20.h, color: AppColors.primary),
      ),
    );
  }

  CustomInputCard _timesTextField(BuildContext context) {
    return CustomInputCard(
      label: '',
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0).w,
      content: Padding(
        padding: const EdgeInsets.all(12.0).w,
        child: Text(medicine.schedule.times.join(', ')),
      ),
      leading: Container(
        padding: const EdgeInsets.all(AppPadding.p14).w,
        child: Icon(Icons.access_time, size: 20.h, color: AppColors.primary),
      ),
    );
  }

  CustomButton _deleteMedicineScheduleButton(BuildContext context) {
    final notificationBloc = context.read<NotificationBloc>();
    final MedicineScheduleBloc medicineScheduleBloc =
        context.read<MedicineScheduleBloc>();
    return CustomButton(
      height: AppHeight.h40.h,
      lable: 'Delete Medicine',
      margin: AppMargin.medium.w,
      backgroundColor: Colors.red,
      onTap: () {
        notificationBloc.add(
          NotificationCanceled(
            id: medicine.index,
            schedule: medicine.schedule,
          ),
        );
        medicineScheduleBloc
            .add(MedicineScheduleDeleted(medicineId: medicine.id));
      },
    );
  }
}
