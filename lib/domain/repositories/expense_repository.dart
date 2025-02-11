import 'package:app_tracker/domain/model/failure_model.dart';
import 'package:either_dart/either.dart';

import '../entities/expense_entity.dart';

abstract class ExpenseRepository {
  Future<Either<String, void>> addExpense(Expense expense);
  Future<Either<String, Map<String, double>>> getTotalExpenseForMonth(
      int year, int month, String currency);
  Either<FailureModel, List<Expense>> getExpenses();
  Future<Either<FailureModel, void>> deleteExpense(int index);
  Future<Either<FailureModel, void>> editExpense(int index, Expense expense);
}
