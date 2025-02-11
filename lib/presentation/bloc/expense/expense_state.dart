import '../../../domain/entities/expense_entity.dart';

abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseSuccess extends ExpenseState {}

class MonthlyExpenseLoaded extends ExpenseState {
  final Map<String, double> total;
  MonthlyExpenseLoaded(this.total);
}
class ExpenseEmpty extends ExpenseState {}
class ExpenseLoadedSuccess extends ExpenseState {
  final List<Expense> expenses;
  final double totalIncome;
  final double totalExpense;

  ExpenseLoadedSuccess(this.expenses, this.totalIncome, this.totalExpense);

  @override
  List<Object?> get props => [expenses, totalIncome, totalExpense];
}

class ExpenseError extends ExpenseState {
  final String message;
  ExpenseError(this.message);
}
