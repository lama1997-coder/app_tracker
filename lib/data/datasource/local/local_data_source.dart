import 'package:hive/hive.dart';

import '../../../domain/entities/expense_entity.dart';

class ExpenseLocalDataSource {
  final Box expenseBox = Hive.box('expenses');

  Future<void> addExpense(Expense expense) async {
    await expenseBox.add(expense.toJson());
  }

  List<Expense> getAllExpenses() {
    return expenseBox.values.map((e) {
      return Expense.fromJson(Map<String, dynamic>.from(e));
    }).toList();
  }


  // Edit Expense
  Future<void> editExpense(int index, Expense expense) async {
    await expenseBox.putAt(index, expense.toJson());
  }

  // Delete Expense
  Future<void> deleteExpense(int index) async {
    await expenseBox.deleteAt(index);
  }
}
