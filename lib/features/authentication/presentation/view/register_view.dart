import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_alert/core/presentation/widgets/custom_back_button.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/messages.dart';
import 'package:med_alert/core/services/service_locator.dart';
import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/core/utils/snack_bar_utils.dart';
import 'package:med_alert/features/authentication/presentation/controller/sign_up/cubit/sign_up_cubit.dart';
import 'package:med_alert/features/authentication/presentation/widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignUpCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.backgroundSecondary,
            leading: const CustomBackButton()),
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state.status == AuthStatus.failure) {
                  SnackBarUtils.showErrorSnackBar(
                      context, AppMessages.regiserationFailed, state.message);
                }
              },
              builder: (context, state) {
                final cubit = context.read<SignUpCubit>();
                return RegisterForm(cubit: cubit, state: state);
              },
            ),
          ),
        ),
      ),
    );
  }
}
