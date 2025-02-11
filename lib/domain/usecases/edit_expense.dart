import 'package:app_tracker/domain/entities/expense_entity.dart';
import 'package:app_tracker/domain/model/failure_model.dart';
import 'package:app_tracker/domain/repositories/expense_repository.dart';
import 'package:either_dart/either.dart';

class EditExpense {
  final ExpenseRepository repository;

  EditExpense(this.repository);

  Future<Either<FailureModel, void>> call(int index, Expense expense) async {
    return await repository.editExpense(index, expense);
  }
}
