import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_alert/core/presentation/widgets/custom_app_bar.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/messages.dart';
import 'package:med_alert/core/services/service_locator.dart';
import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/core/utils/snack_bar_utils.dart';
import 'package:med_alert/features/authentication/presentation/controller/login/cubit/login_cubit.dart';
import 'package:med_alert/features/authentication/presentation/widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar:
            const CustomAppBar(backgroundColor: AppColors.backgroundSecondary),
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.status == AuthStatus.failure) {
                  SnackBarUtils.showErrorSnackBar(
                      context, AppMessages.loginFailed, state.message);
                }
              },
              builder: (context, state) {
                final cubit = context.read<LoginCubit>();
                return LoginForm(cubit: cubit, state: state);
              },
            ),
          ),
        ),
      ),
    );
  }
}
