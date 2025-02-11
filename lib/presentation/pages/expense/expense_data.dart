import 'package:app_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:app_tracker/presentation/bloc/expense/expense_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseData {
  final List<String> categories = [
    'Food',
    'Transport',
    'Entertainment',
    'Bills',
    'Other'
  ]; // Add categories

  final TextEditingController categoryController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();
  // String selectedCurrency = 'USD';
  final List<String> currencies = ['USD', 'EUR', 'GBP', 'AED'];

  deleteExpense(BuildContext context, int id) {
    context.read<ExpenseBloc>().add(DeleteExpenseEvent(id));
    Navigator.of(context).pop();
    showResult(context, "Delete", "Delete Successfully");
  }

  void showResult(BuildContext context, String? title, String? subtitle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title ?? "Form Submitted"),
        content: Text(subtitle ?? "The new sheet has been added successfully."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // context.read<SheetBloc>().add(SheetLoadingEvent());
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
