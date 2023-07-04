import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:med_alert/core/helpers/validator.dart';
import 'package:med_alert/core/presentation/widgets/custom_button.dart';
import 'package:med_alert/core/presentation/widgets/custom_input_field.dart';
import 'package:med_alert/core/presentation/widgets/custom_progress_indicator.dart';
import 'package:med_alert/core/resources/colors.dart';
import 'package:med_alert/core/resources/routes.dart';
import 'package:med_alert/core/resources/strings.dart';
import 'package:med_alert/core/resources/values.dart';
import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/features/authentication/presentation/controller/login/cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.cubit,
    required this.state,
  });

  final LoginCubit cubit;
  final LoginState state;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: AppMargin.largeH.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _loginHeaderTitle(textTheme),
          SizedBox(height: AppHeight.h40.h),
          _emailTextField(cubit),
          SizedBox(height: AppHeight.h16.h),
          _passwordTextField(cubit, state),
          _forgetPasswordButton(textTheme),
          SizedBox(height: AppHeight.h48.h),
          state.status == AuthStatus.submiting
              ? const CustomProgressIndicator()
              : _loginButton(cubit),
          SizedBox(height: AppHeight.h16.h),
          _registerNow(context, textTheme),
        ],
      ),
    );
  }

  CustomButton _loginButton(LoginCubit cubit) {
    return CustomButton(
      onTap: () => cubit.login(),
      lable: AppStrings.login,
      backgroundColor: AppColors.accent,
      margin: AppMargin.mediumH.w,
    );
  }

  CustomInputField _passwordTextField(LoginCubit cubit, LoginState state) {
    return CustomInputField(
      hint: AppStrings.passwordHint,
      obscureText: true,
      prefixIcon: Icons.lock,
      controller: cubit.passwordController,
      validator: (value) => Validator.validatePassword(value!),
      isPasswordVisible: state.isPasswordVisible,
      toggelPasswordVisibility: () => cubit.togglePasswordVisibility(),
    );
  }

  CustomInputField _emailTextField(LoginCubit cubit) {
    return CustomInputField(
      hint: AppStrings.emailHint,
      prefixIcon: Icons.email,
      controller: cubit.emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validator.validateEmail(value!),
    );
  }

  Column _loginHeaderTitle(TextTheme textTheme) {
    return Column(
      children: [
        Text(AppStrings.loginTitle, style: textTheme.titleLarge),
        SizedBox(height: AppHeight.h6.h),
        Text(
          AppStrings.loginDescription,
          style: textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Row _forgetPasswordButton(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.forgotPassword,
            style: textTheme.bodySmall!.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Row _registerNow(BuildContext context, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.notMemberYet, style: textTheme.bodySmall),
        TextButton(
          onPressed: () => context.goNamed(AppRoutes.register.name),
          child: Text(
            AppStrings.registerNow,
            style: textTheme.bodySmall!.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
