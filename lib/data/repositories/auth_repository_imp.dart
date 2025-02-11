import 'package:app_tracker/domain/model/failure_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/model/failure_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/remote/remote_datasource.dart';
import 'package:either_dart/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<FailureModel, UserEntity>> register(String email, String password) {
    return remoteDataSource.register(email, password);
  }

  @override
  Future<Either<FailureModel, UserEntity>> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }

  @override
  Future<Either<FailureModel, UserEntity>> isTokenValid() {
    return remoteDataSource.isTokenValid();

  }
}
