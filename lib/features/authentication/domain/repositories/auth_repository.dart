import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:med_alert/core/data/error/failure.dart';
import 'package:med_alert/features/authentication/domain/entities/user_profile.dart';

abstract class AuthRepository {
  User getUserProfile();
  Stream<User?> userStateChange();
  Future<Either<Failure, Unit>> signInWithEmailAndPassword(UserProfile user);
  Future<Either<Failure, Unit>> createUserWithEmailAndPassword(
      UserProfile user);
  Future<Either<Failure, Unit>> signOut();
}
