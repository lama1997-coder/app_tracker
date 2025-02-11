import 'package:app_tracker/data/datasource/local/storage_helper.dart';
import 'package:app_tracker/data/datasource/local/storage_keys.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/model/failure_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<FailureModel, UserEntity>> register(
      String email, String password);
  Future<Either<FailureModel, UserEntity>> login(String email, String password);
  Future<Either<FailureModel, UserEntity>> isTokenValid();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl(this.firebaseAuth);

  Future<Either<FailureModel, UserEntity>> register(
      String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        String? token = await user.getIdToken();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token ?? "");
        return Right(UserEntity(uid: user.uid, email: user.email ?? ""));
      } else {
        return Left(ServerFailure("Registration failed, please try again."));
      }
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(_mapFirebaseErrorToMessage(e.code)));
    }
  }

  String _mapFirebaseErrorToMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'weak-password':
        return 'Password should be at least 6 characters.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';

      case 'network-request-failed':
        return 'Check your internet connection.';
      default:
        return 'An unexpected error occurred.';
    }
  }

  @override
  Future<Either<FailureModel, UserEntity>> login(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        String? token = await user.getIdToken();
        if (token != null) {
          await StorageHelper.set(StorageKeys.fcm_token, token);
          await StorageHelper.set(StorageKeys.userId, user.uid);
        }
        return Right(UserEntity(uid: user.uid, email: user.email ?? ""));
      } else {
        return Left(ServerFailure("Login failed. User not found."));
      }
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(_mapFirebaseErrorToMessage(e.code)));
    }
  }

  @override
  Future<Either<FailureModel, UserEntity>> isTokenValid() async {
    User? user = firebaseAuth.currentUser;
    if (user == null) {
      return Left(TokenExpire("No user logged in"));
    }
    try {
      String? token = await user.getIdToken();
      return Right(UserEntity(uid: user.uid, email: user.email ?? ""));
    } catch (e) {
      return Left(ServerFailure("Error validating token: $e"));
    }
  }
}
