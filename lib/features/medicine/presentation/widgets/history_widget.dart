import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pill/core/services/service_locator.dart';
import 'package:smart_pill/features/medicine/presentation/components/history_section.dart';
import 'package:smart_pill/features/medicine/presentation/controller/medicine/cubit/medicine_cubit.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicineCubit>(
      create: (context) => sl<MedicineCubit>(),
      child: BlocBuilder<MedicineCubit, MedicineState>(
        builder: (context, state) {
          return HistorySection(
            medicines: state.medicines,
            currentWeekday: state.currentWeekday,
          );
        },
      ),
    );
  }
}
