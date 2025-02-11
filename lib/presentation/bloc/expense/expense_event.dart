import '../../../domain/entities/expense_entity.dart';

abstract class ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent {
  final Expense expense;
  AddExpenseEvent(this.expense);
}

class GetMonthlyExpenseEvent extends ExpenseEvent {
  final int year, month;
  final String currency;
  GetMonthlyExpenseEvent(this.year, this.month, this.currency);
}
class LoadExpenses extends ExpenseEvent {}
class EditExpenseEvent extends ExpenseEvent {
  final int index;
  final Expense expense;

  EditExpenseEvent(this.index, this.expense);

  @override
  List<Object> get props => [index, expense];
}
class DeleteExpenseEvent extends ExpenseEvent {
  final int index;

  DeleteExpenseEvent(this.index);

  @override
  List<Object> get props => [index];
}