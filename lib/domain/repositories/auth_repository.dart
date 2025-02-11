import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/user_entity.dart';
import '../model/failure_model.dart';

abstract class AuthRepository {
  Future<Either<FailureModel, UserEntity>> register(String email, String password);
  Future<Either<FailureModel, UserEntity>> login(String email, String password);
  Future<Either<FailureModel, UserEntity>> isTokenValid();

}
