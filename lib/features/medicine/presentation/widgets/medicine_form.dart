import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_alert/core/helpers/id_generator.dart';

import 'package:med_alert/core/presentation/widgets/custom_button.dart';
import 'package:med_alert/core/presentation/widgets/custom_input_card.dart';
import 'package:med_alert/core/presentation/widgets/custom_progress_indicator.dart';
import 'package:med_alert/core/presentation/widgets/day_time_card_tile.dart';
import 'package:med_alert/core/presentation/widgets/day_time_list.dart';
import 'package:med_alert/core/presentation/widgets/medicine_text_field.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/messages.dart';
import 'package:med_alert/core/resources/values.dart';
import 'package:med_alert/core/services/service_locator.dart';
import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/core/utils/extensions.dart';
import 'package:med_alert/features/medicine/domain/entities/medicine_schedule.dart';
import 'package:med_alert/features/medicine/domain/entities/schedule.dart';
import 'package:med_alert/features/medicine/presentation/controller/medicine_form/cubit/medicine_form_cubit.dart';
import 'package:med_alert/features/medicine/presentation/controller/medicine_schedule/bloc/medicine_schedule_bloc.dart';
import 'package:med_alert/features/notifications/domain/entities/notification.dart';
import 'package:med_alert/features/notifications/presentation/controller/bloc/notification_bloc.dart';

class MedicineForm extends StatelessWidget {
  const MedicineForm({
    super.key,
    required this.patientId,
    required this.index,
  });
  final String patientId;
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
            final MedicineFormCubit medicineFormCubit =
                context.read<MedicineFormCubit>();
            return BlocBuilder<MedicineScheduleBloc, MedicineScheduleState>(
                builder: (context, medicineScheduleState) {
              final MedicineScheduleBloc medicineScheduleBloc =
                  context.read<MedicineScheduleBloc>();
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _dragLable(),
                  Row(
                    children: [
                      Expanded(child: _medicineNameTextField(context)),
                      Flexible(child: _doseCounter(context)),
                    ],
                  ),
                  _weekdaysWidget(context),
                  _timeIntervalsWidget(medicineFormCubit, medicineFormState),
                  medicineScheduleBloc.state.status == RequestStatus.loading
                      ? const CustomProgressIndicator()
                      : _addMedcineButton(context, patientId),
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
    final medcineFormCubit = context.read<MedicineFormCubit>();
    final medcineFormState = medcineFormCubit.state;
    return CustomInputCard(
      label: 'Medicine Name',
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0).w,
      content: MedicineTextField(
        controller: medcineFormCubit.medicineNameController,
        hintText: 'Enter medicine name',
      ),
      leading: GestureDetector(
        onTap: () => medcineFormCubit.toggleMedicineType(),
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p14).w,
          child: ImageIcon(AssetImage(medcineFormState.type.icon),
              size: 10.h, color: AppColors.primary),
        ),
      ),
    );
  }

  CustomInputCard _doseCounter(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final medcineFormCubit = context.read<MedicineFormCubit>();
    final medcineFormState = medcineFormCubit.state;
    return CustomInputCard(
      label: 'Dose',
      margin: const EdgeInsets.fromLTRB(8, 8, 16, 8).w,
      content: Center(
          child: Text('${medcineFormState.dose}', style: textTheme.bodyMedium)),
      leading: GestureDetector(
          onTap: () => medcineFormCubit.decrementDose(),
          child: const Icon(Icons.remove, color: AppColors.primary)),
      trailing: GestureDetector(
          onTap: () => medcineFormCubit.incrementDose(),
          child: const Icon(Icons.add, color: AppColors.primary)),
    );
  }

  Widget _weekdaysWidget(BuildContext context) {
    final medcineFormCubit = context.read<MedicineFormCubit>();
    final medcineFormState = medcineFormCubit.state;
    return DayTimeList(
      title: 'Weekdays',
      dayTime: medcineFormCubit.weekdays,
      height: AppHeight.h72.h,
      itemBuilder: (context, index) {
        final int day = medcineFormCubit.weekdays[index];
        return DayTimeCardTile(
          showIcon: true,
          selectedTextColor: AppColors.black,
          title: medcineFormCubit.weekdaysNames[index],
          onTap: () => medcineFormCubit.toggleDaySelection(day),
          isSelected: medcineFormState.selectedDays.contains(day),
        );
      },
    );
  }

  Widget _timeIntervalsWidget(
    MedicineFormCubit medcineFormCubit,
    MedicineFormState state,
  ) {
    return DayTimeList(
      title: 'Times',
      height: AppHeight.h60.h,
      dayTime: medcineFormCubit.timeIntervals,
      itemBuilder: (context, index) {
        final String time = medcineFormCubit.timeIntervals[index];
        return DayTimeCardTile(
          title: '${time.split(' ')[0]}\n${time.split(' ')[1]}',
          onTap: () => medcineFormCubit.toggleTimeSelection(time),
          isSelected: state.selectedTimes.contains(time),
        );
      },
    );
  }

  CustomButton _addMedcineButton(BuildContext context, String patientId) {
    final medcineFormCubit = context.read<MedicineFormCubit>();
    final medcineFormState = medcineFormCubit.state;
    final medicineBloc = context.read<MedicineScheduleBloc>();
    final notificationBloc = context.read<NotificationBloc>();
    return CustomButton(
      height: AppHeight.h40.h,
      lable: 'Add Medcine',
      margin: AppMargin.medium.w,
      backgroundColor: AppColors.accent,
      onTap: () {
        final Schedule schedule = Schedule(
          days: medcineFormState.selectedDays,
          times: medcineFormState.selectedTimes,
        );
        medicineBloc.add(
          MedicineScheduleAdded(
            medicineSchedule: MedicineSchedule(
              id: IdGenerator.generateMedicineId(patientId, index),
              index: index,
              userId: patientId,
              medicine: medcineFormCubit.medicineNameController.text,
              dose: medcineFormState.dose,
              type: medcineFormState.type,
              schedule: schedule,
            ),
          ),
        );
        notificationBloc.add(
          WeeklyNotificationScheduled(
            notification: NotificationData(
              id: index,
              title: 'Medicine Time',
              body: AppMessages.getMedicineNotificationMessage(
                medcineFormState.dose,
                medcineFormCubit.medicineNameController.text,
                medcineFormState.type.name,
              ),
              schedule: schedule,
            ),
          ),
        );
      },
    );
  }
}
