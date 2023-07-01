import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_pill/core/presentation/widgets/custom_button.dart';
import 'package:smart_pill/core/presentation/widgets/custom_input_card.dart';
import 'package:smart_pill/core/presentation/widgets/custom_progress_indicator.dart';
import 'package:smart_pill/core/presentation/widgets/day_time_card_tile.dart';
import 'package:smart_pill/core/presentation/widgets/day_time_list.dart';
import 'package:smart_pill/core/presentation/widgets/medicine_text_field.dart';
import 'package:smart_pill/core/resources/colors.dart';
import 'package:smart_pill/core/resources/messages.dart';
import 'package:smart_pill/core/resources/strings.dart';
import 'package:smart_pill/core/resources/values.dart';
import 'package:smart_pill/core/services/service_locator.dart';
import 'package:smart_pill/core/utils/enums.dart';
import 'package:smart_pill/core/utils/extensions.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';
import 'package:smart_pill/features/medicine/domain/entities/schedule.dart';
import 'package:smart_pill/features/medicine/presentation/components/date_time_picker.dart';
import 'package:smart_pill/features/medicine/presentation/controller/dispenser_form/cubit/dispenser_form_cubit.dart';
import 'package:smart_pill/features/medicine/presentation/controller/new_dispenser/bloc/new_dispenser_bloc.dart';
import 'package:smart_pill/features/notifications/domain/entities/notification.dart';
import 'package:smart_pill/features/notifications/presentation/controller/bloc/notification_bloc.dart';

class AddDispenserForm extends StatelessWidget {
  const AddDispenserForm({
    super.key,
    required this.patientId,
  });
  final String patientId;

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
            final DispenserFormCubit dispenserCubit =
                context.read<DispenserFormCubit>();
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
                  _weekdaysWidget(context),
                  // _timeIntervalsWidget(dispenserCubit, dispenserState),
                  _dateTimePicker(dispenserCubit, dispenserState),
                  addPatientBloc.state.status == RequestStatus.loading
                      ? const CustomProgressIndicator()
                      : _addDispenserButton(context, patientId),
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
    final dispenserCubit = context.read<DispenserFormCubit>();
    final dispenserState = dispenserCubit.state;
    return CustomInputCard(
      label: 'Medicine Name',
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0).w,
      content: MedicineTextField(
        controller: dispenserCubit.medicineNameController,
        hintText: 'Enter medicine name',
      ),
      leading: GestureDetector(
        onTap: () => dispenserCubit.toggleMedicineType(),
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p14).w,
          child: ImageIcon(AssetImage(dispenserState.type.icon),
              size: 10.h, color: AppColors.primary),
        ),
      ),
    );
  }

  CustomInputCard _indexTextField(BuildContext context) {
    final dispenserCubit = context.read<DispenserFormCubit>();
    return CustomInputCard(
      width: AppWidth.w72,
      label: 'Index',
      margin: const EdgeInsets.fromLTRB(16, 8, 8, 8).w,
      content: MedicineTextField(
        controller: dispenserCubit.idController,
        hintText: '1 ~ 4',
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
      ),
    );
  }

  CustomInputCard _doseCounter(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final dispenserCubit = context.read<DispenserFormCubit>();
    final dispenserState = dispenserCubit.state;
    final String type = dispenserState.type.name;
    return CustomInputCard(
      label: 'Dose',
      margin: const EdgeInsets.fromLTRB(8, 8, 16, 8).w,
      content: Center(
          child: Text('${dispenserState.dose} $type',
              style: textTheme.bodyMedium)),
      leading: GestureDetector(
          onTap: () => dispenserCubit.decrementDose(),
          child: const Icon(Icons.remove, color: AppColors.primary)),
      trailing: GestureDetector(
          onTap: () => dispenserCubit.incrementDose(),
          child: const Icon(Icons.add, color: AppColors.primary)),
    );
  }

  Widget _weekdaysWidget(BuildContext context) {
    final dispenserCubit = context.read<DispenserFormCubit>();
    final dispenserState = dispenserCubit.state;
    return DayTimeList(
      title: 'Weekdays',
      dayTime: dispenserCubit.weekdays,
      height: AppHeight.h72.h,
      itemBuilder: (context, index) {
        final int day = dispenserCubit.weekdays[index];
        return DayTimeCardTile(
          showIcon: true,
          selectedTextColor: AppColors.black,
          title: dispenserCubit.weekdaysNames[index],
          onTap: () => dispenserCubit.toggleDaySelection(day),
          isSelected: dispenserState.selectedDays.contains(day),
        );
      },
    );
  }

  Widget _timeIntervalsWidget(
      DispenserFormCubit dispenserCubit, DispenserFormState state) {
    return DayTimeList(
      title: 'Times',
      height: AppHeight.h60.h,
      dayTime: dispenserCubit.timeIntervals,
      itemBuilder: (context, index) {
        final String time = dispenserCubit.timeIntervals[index];
        return DayTimeCardTile(
          title: '${time.split(' ')[0]}\n${time.split(' ')[1]}',
          onTap: () => dispenserCubit.toggleTimeSelection(time),
          isSelected: state.selectedTimes.contains(time),
        );
      },
    );
  }

  CustomButton _addDispenserButton(BuildContext context, String patientId) {
    final dispenserCubit = context.read<DispenserFormCubit>();
    final dispenserState = dispenserCubit.state;
    final addPatientBloc = context.read<NewDispenserBloc>();
    final notificationBloc = context.read<NotificationBloc>();
    return CustomButton(
      height: AppHeight.h40.h,
      lable: 'Add Dispenser',
      margin: AppMargin.medium.w,
      backgroundColor: AppColors.accent,
      onTap: () {
        final String index = dispenserCubit.idController.text;
        final Schedule schedule = Schedule(
          days: dispenserState.selectedDays,
          times: dispenserState.selectedTimes,
          time: dispenserState.selectedTime,
        );
        addPatientBloc.add(
          DispenserAdded(
            dispenser: Dispenser(
              id: AppStrings.generateDispenserId(patientId, index),
              index: index,
              userId: patientId,
              medicine: dispenserCubit.medicineNameController.text,
              dose: dispenserState.dose,
              type: dispenserState.type,
              schedule: schedule,
            ),
          ),
        );
        notificationBloc.add(
          WeeklyNotificationScheduled(
            notification: NotificationData(
              id: int.parse(dispenserCubit.idController.text),
              title: 'Medicine Time',
              body: AppMessages.getMedicineNotificationMessage(
                dispenserState.dose,
                dispenserCubit.medicineNameController.text,
                dispenserState.type.name,
              ),
              schedule: schedule,
            ),
          ),
        );
      },
    );
  }

  Widget _dateTimePicker(
      DispenserFormCubit dispenserCubit, DispenserFormState dispenserState) {
    return CustomDateTimePicker(
      onDateTimeChanged: (time) => dispenserCubit.onDateTimeChanged(time),
    );
  }
}
