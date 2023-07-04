import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_alert/core/domain/usecase/usecase.dart';
import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/features/authentication/domain/entities/user_profile.dart';
import 'package:med_alert/features/authentication/domain/usecases/get_user_profile_usecase.dart';
import 'package:med_alert/features/authentication/domain/usecases/user_state_change_usecase.dart';
import 'package:med_alert/features/authentication/domain/usecases/logout_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogoutUseCase logoutUseCase;
  final GetUserProfileUseCase getUserProfileUseCase;
  final UserStateChangeUseCase userStateChangeUseCase;

  late final StreamSubscription<User?> userStateSubscription;

  AuthBloc(
    this.logoutUseCase,
    this.getUserProfileUseCase,
    this.userStateChangeUseCase,
  ) : super(const AuthState()) {
    on<AuthChecked>(_onAuthChecked);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<UserProfileFetched>(_onUserProfileFetched);

    userStateSubscription = userStateChangeUseCase().listen((user) {
      add(AuthChecked(user));
      if (user != null) {
        add(UserProfileFetched());
      }
    });
  }

  Future<FutureOr<void>> _onAuthChecked(
      AuthChecked event, Emitter<AuthState> emit) async {
    User? user = event.user;
    if (user != null) {
      emit(state.copyWith(status: AppStatus.authenticated));
    } else {
      emit(state.copyWith(status: AppStatus.unauthenticated));
    }
  }

  Future<FutureOr<void>> _onLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    await logoutUseCase(const NoParams());
    emit(state.copyWith(
        status: AppStatus.unauthenticated, user: const UserProfile.empty()));
  }

  FutureOr<void> _onUserProfileFetched(
      UserProfileFetched event, Emitter<AuthState> emit) {
    User? user = getUserProfileUseCase();
    if (user != null) {
      emit(
        state.copyWith(
          status: AppStatus.authenticated,
          user: UserProfile(
            id: user.uid,
            email: user.email,
            username: user.displayName,
          ),
        ),
      );
    } else {
      emit(state.copyWith(user: const UserProfile.empty()));
    }
  }

  String? getCurrentUserId() {
    final user = getUserProfileUseCase();
    return user?.uid;
  }
}
