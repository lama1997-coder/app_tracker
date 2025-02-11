import 'package:app_tracker/domain/model/failure_model.dart';
import 'package:either_dart/either.dart';

import '../entities/expense_entity.dart';
import '../repositories/expense_repository.dart';

class GetAllExpense {
  final ExpenseRepository repository;

  GetAllExpense(this.repository);

  Either<FailureModel, List<Expense>> call() {
    return repository.getExpenses();
  }
}
