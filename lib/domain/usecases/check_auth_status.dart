import 'package:either_dart/either.dart';

import '../entities/user_entity.dart';
import '../model/failure_model.dart';
import '../repositories/auth_repository.dart';

class CheckAuthStatus {
  final AuthRepository repository;

  CheckAuthStatus(this.repository);

  Future<Either<FailureModel, UserEntity>> call() async {
    return await repository.isTokenValid();
  }
}
