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
import 'package:med_alert/features/authentication/presentation/controller/sign_up/cubit/sign_up_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.cubit,
    required this.state,
  });

  final SignUpCubit cubit;
  final SignUpState state;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Form(
      key: cubit.formKey,
      child: Container(
        margin: AppMargin.largeH.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _loginHeaderTitle(textTheme),
            SizedBox(height: AppHeight.h32.h),
            _usernameTextField(cubit),
            SizedBox(height: AppHeight.h16.h),
            _emailTextField(cubit),
            SizedBox(height: AppHeight.h16.h),
            _passwordTextField(cubit, state),
            SizedBox(height: AppHeight.h16.h),
            _confirmPasswordTextField(cubit, state),
            SizedBox(height: AppHeight.h40.h),
            state.status == AuthStatus.submiting
                ? const CustomProgressIndicator()
                : _loginButton(cubit),
            _loginNow(context, textTheme),
          ],
        ),
      ),
    );
  }
}

CustomButton _loginButton(SignUpCubit cubit) {
  return CustomButton(
    onTap: () => cubit.signUp(),
    lable: AppStrings.signUp,
    backgroundColor: AppColors.accent,
    margin: AppMargin.mediumH.w,
  );
}

CustomInputField _passwordTextField(SignUpCubit cubit, SignUpState state) {
  return CustomInputField(
    obscureText: true,
    hint: AppStrings.passwordHint,
    prefixIcon: Icons.lock,
    controller: cubit.passwordController,
    isPasswordVisible: state.isPasswordVisible,
    validator: (value) => Validator.validatePassword(value!),
    toggelPasswordVisibility: () => cubit.togglePasswordVisibility(),
  );
}

CustomInputField _confirmPasswordTextField(
    SignUpCubit cubit, SignUpState state) {
  return CustomInputField(
    obscureText: true,
    prefixIcon: Icons.lock,
    hint: AppStrings.confirmPasswordHint,
    controller: cubit.confirmPasswordController,
    isPasswordVisible: state.isPasswordVisible,
    validator: (value) => Validator.validateConfirmPassword(
        value!, cubit.passwordController.text),
    toggelPasswordVisibility: () => cubit.togglePasswordVisibility(),
  );
}

CustomInputField _emailTextField(SignUpCubit cubit) {
  return CustomInputField(
    hint: AppStrings.emailHint,
    prefixIcon: Icons.email_rounded,
    controller: cubit.emailController,
    keyboardType: TextInputType.emailAddress,
    validator: (value) => Validator.validateEmail(value!),
  );
}

CustomInputField _usernameTextField(SignUpCubit cubit) {
  return CustomInputField(
    hint: AppStrings.usernameHint,
    prefixIcon: Icons.person,
    controller: cubit.usernameController,
    textCapitalization: TextCapitalization.words,
    keyboardType: TextInputType.emailAddress,
    validator: (value) => Validator.validateField(value!),
  );
}

Column _loginHeaderTitle(TextTheme textTheme) {
  return Column(
    children: [
      Text(AppStrings.registerTitle, style: textTheme.titleLarge),
      SizedBox(height: AppHeight.h6.h),
      Text(
        AppStrings.registerDescription,
        style: textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Row _loginNow(BuildContext context, TextTheme textTheme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(AppStrings.alreadyHaveAcc, style: textTheme.bodySmall),
      TextButton(
        onPressed: () => context.goNamed(AppRoutes.login.name),
        child: Text(
          AppStrings.loginNow,
          style: textTheme.bodySmall!.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
