import 'package:app_tracker/domain/model/failure_model.dart';
import 'package:either_dart/either.dart';
import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/expense_repository.dart';
import '../datasource/local/local_data_source.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseLocalDataSource localDataSource;

  ExpenseRepositoryImpl(this.localDataSource);

  @override
  Future<Either<String, void>> addExpense(Expense expense) async {
    try {
      await localDataSource.addExpense(expense);
      return Right(null);
    } catch (e) {
      return Left("Failed to add expense");
    }
  }

  @override
  Future<Either<String, Map<String, double>>> getTotalExpenseForMonth(
      int year, int month, String currency) async {
    try {
      final expenses = localDataSource.getAllExpenses();
      Map<String, double> categorizedExpenses = {};
      for (var e in expenses.where((e) =>
          e.date.year == year &&
          e.date.month == month &&
          e.currency == currency)) {
        categorizedExpenses[e.category] =
            (categorizedExpenses[e.category] ?? 0) + e.amount;
      }
      // final total = expenses
      //     .where((e) =>
      //         e.date.year == year &&
      //         e.date.month == month &&
      //         e.currency == currency)
      //     .fold(0.0, (sum, e) => sum + e.amount);

      return Right(categorizedExpenses);
    } catch (e) {
      return Left("Failed to load expenses");
    }
  }

  @override
  Either<FailureModel, List<Expense>> getExpenses() {
    try {
      final expenses = localDataSource.getAllExpenses();
      return Right(expenses);
    } catch (e) {
      return Left(ServerFailure("Failed to load expenses: ${e.toString()}"));
    }
  }

  @override
  Future<Either<FailureModel, void>> deleteExpense(int index) async {
    try {
      await localDataSource.deleteExpense(index);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to delete expense'));
    }
  }

  @override
  Future<Either<FailureModel, void>> editExpense(
      int index, Expense expense) async {
    try {
      await localDataSource.editExpense(index, expense);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to edit expense'));
    }
  }
}
