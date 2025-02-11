import 'package:either_dart/either.dart';

import '../repositories/expense_repository.dart';

class GetMonthlyExpense {
  final ExpenseRepository repository;

  GetMonthlyExpense(this.repository);

  Future<Either<String, Map<String, double>>> call(int year, int month, String currency) {
    return repository.getTotalExpenseForMonth(year, month, currency);
  }
}
