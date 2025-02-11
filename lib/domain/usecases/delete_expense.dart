import 'package:app_tracker/domain/model/failure_model.dart';
import 'package:either_dart/either.dart';

import '../repositories/expense_repository.dart';

class DeleteExpense {
  final ExpenseRepository repository;

  DeleteExpense(this.repository);

  Future<Either<FailureModel, void>> call(int index) async {
    return await repository.deleteExpense(index);
  }
}