import 'package:either_dart/either.dart';

import '../entities/user_entity.dart';
import '../model/failure_model.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);
  Future<Either<FailureModel, UserEntity>> call(String email, String password) {
    return repository.register(email, password);
  }
}
