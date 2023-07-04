import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/features/authentication/domain/entities/user_profile.dart';
import 'package:med_alert/features/authentication/domain/usecases/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpUseCase) : super(const SignUpState());

  final SignUpUseCase signUpUseCase;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(status: AuthStatus.submiting));
      final result = await signUpUseCase(
        UserProfile(
          email: emailController.text,
          password: passwordController.text,
          username: usernameController.text,
        ),
      );
      result.fold(
        (failure) => emit(state.copyWith(
            status: AuthStatus.failure, message: failure.message)),
        (user) => emit(state.copyWith(status: AuthStatus.success)),
      );
    }
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}
