import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_pill/core/presentation/view/header_widget.dart';
import 'package:smart_pill/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';
import 'package:smart_pill/features/medicine/presentation/widgets/calendar_widget.dart';
import 'package:smart_pill/features/medicine/presentation/widgets/dispenser_widget.dart';
import 'package:smart_pill/features/medicine/presentation/widgets/history_widget.dart';
import 'package:smart_pill/features/medicine/presentation/widgets/medicine_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.authBloc});
  final AuthBloc authBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 42).h,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HeaderWidget(authBloc: authBloc),
                const CalendarWidget(),
                const SizedBox(height: 20),
                const MedicineWidget(),
                const SizedBox(height: 20),
                const HistoryWidget(),
                const SizedBox(height: 20),
                DispenserWidget(patientId: authBloc.state.user.id!),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
