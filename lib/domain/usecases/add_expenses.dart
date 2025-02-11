import 'package:either_dart/either.dart';

import '../entities/expense_entity.dart';
import '../repositories/expense_repository.dart';

class AddExpense {
  final ExpenseRepository repository;

  AddExpense(this.repository);
  Future<Either<String, void>> call(Expense expense) {
    return repository.addExpense(expense);
  }


}