import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/user_entity.dart';
import '../model/failure_model.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<FailureModel, UserEntity>> call(String email, String password) {
    return repository.login(email, password);
  }
}
