import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:med_alert/core/data/error/exceptions.dart';
import 'package:med_alert/core/data/remote/network_connection.dart';

abstract class AuthDataSource {
  User getUserProfile();
  Stream<User?> userChangeState();
  Future<Unit> signInWithEmailAndPassword(String email, String password);
  Future<Unit> createUserWithEmailAndPassword(
    String email,
    String password,
    String username,
  );
  Future<Unit> signOut();
}

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl(
    this.firebaseAuth,
    this.networkConnection,
  );
  final FirebaseAuth firebaseAuth;
  final NetworkConnection networkConnection;

  @override
  User getUserProfile() {
    return firebaseAuth.currentUser!;
  }

  @override
  Stream<User?> userChangeState() {
    firebaseAuth.currentUser?.reload();
    return firebaseAuth.authStateChanges();
  }

  @override
  Future<Unit> createUserWithEmailAndPassword(
      String email, String password, String username) async {
    return await getFirebaseService(firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => value.user!.updateDisplayName(username)));
  }

  @override
  Future<Unit> signInWithEmailAndPassword(String email, String password) async {
    return await getFirebaseService(
      firebaseAuth.signInWithEmailAndPassword(email: email, password: password),
    );
  }

  @override
  Future<Unit> signOut() async {
    return await getFirebaseService(firebaseAuth.signOut());
  }

  Future<Unit> getFirebaseService(Future<void> function) async {
    final bool isConnected = await networkConnection.isConnected();
    if (isConnected) {
      try {
        await function;
        return Future.value(unit);
      } on FirebaseException catch (_) {
        throw AuthenticationException();
      } catch (_) {
        throw UnexpectedException();
      }
    } else {
      throw NetworkException();
    }
  }
}
