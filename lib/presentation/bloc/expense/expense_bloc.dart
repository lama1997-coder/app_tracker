import 'package:app_tracker/domain/usecases/edit_expense.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/expense_entity.dart';
import '../../../domain/usecases/add_expenses.dart';
import '../../../domain/usecases/delete_expense.dart';
import '../../../domain/usecases/get_all_expense.dart';
import '../../../domain/usecases/get_monthly_expense.dart';
import 'expense_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final AddExpense addExpense;
  final GetMonthlyExpense getMonthlyExpense;
  final GetAllExpense getAllExpense;
  final EditExpense editExpenseUseCase;
  final DeleteExpense deleteExpenseUseCase;

  ExpenseBloc({required this.addExpense,
    required this.getMonthlyExpense,
    required this.getAllExpense,
    required this.editExpenseUseCase,
    required this.deleteExpenseUseCase})
      : super(ExpenseInitial()) {
    on<AddExpenseEvent>((event, emit) async {
      emit(ExpenseLoading());
      final result = await addExpense(event.expense);
      result.fold((failure) => emit(ExpenseError(failure)), (_) {
        emit(ExpenseSuccess());
        add(LoadExpenses());
      });
    });

    on<GetMonthlyExpenseEvent>((event, emit) async {
      emit(ExpenseLoading());
      final result =
      await getMonthlyExpense(event.year, event.month, event.currency);
      result.fold((failure) => emit(ExpenseError(failure)),
              (total) => emit(MonthlyExpenseLoaded(total)));
    });
    on<LoadExpenses>((event, emit) {
      emit(ExpenseLoading());
      final expenses = getAllExpense();
      expenses.fold((failure) => emit(ExpenseError(failure.message)), (data) {
        double totalIncome = 0;
        double totalExpense = 0;


        for (var exp in data) {
          if (exp.amount > 0) {
            totalIncome += exp.amount;
          } else {
            totalExpense += exp.amount;
          }
        }

        emit(ExpenseLoadedSuccess(data, totalIncome, totalExpense));
      });
    });
    on<EditExpenseEvent>((event, emit) async {
      emit(ExpenseLoading());
      final result = await editExpenseUseCase(event.index, event.expense);
      result.fold((failure) => emit(ExpenseError(failure.message)), (_) {
        emit(ExpenseSuccess());
        add(LoadExpenses());
      });
    });

    on<DeleteExpenseEvent>((event, emit) async {
      emit(ExpenseLoading());
      final result = await deleteExpenseUseCase(event.index);
      result.fold((failure) => emit(ExpenseError(failure.message)), (_) {
        emit(ExpenseSuccess());
        add(LoadExpenses());
      });
    });
  }
}
