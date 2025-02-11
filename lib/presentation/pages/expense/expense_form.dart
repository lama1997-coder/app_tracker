part of 'import.dart';

class ExpenseForm extends StatefulWidget {
  final Expense? expense;
  final int? index;
  const ExpenseForm({super.key, this.expense, this.index});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  late ExpenseData expenseData;
  late bool isEditing;
  @override
  void initState() {
    super.initState();
    isEditing = widget.expense != null;
    expenseData = ExpenseData();

    if (isEditing) {
      expenseData.titleController.text = widget.expense!.title;
      context.read<CategoryCubit>().changeCategory(widget.expense!.category);
      expenseData.amountController.text = widget.expense!.amount.toString();
      context.read<CurrencyCubit>().changeCurrency(widget.expense!.currency);
    }
  }

  void _handleSubmit() {
    final selectedCategory = context.read<CategoryCubit>().state;  // Get selected category
    final selectedCurrency = context.read<CurrencyCubit>().state;
    final expense = Expense(
      title: expenseData.titleController.text,
      category: selectedCategory,
      amount: double.parse(expenseData.amountController.text),
      currency: selectedCurrency,
      date: DateTime.now(),
    );

    if (isEditing && widget.index != null) {
      context
          .read<ExpenseBloc>()
          .add(EditExpenseEvent(widget.index ?? 0, expense));
    } else {
      context.read<ExpenseBloc>().add(AddExpenseEvent(expense));
    }

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultText(title: "Add Expense"),
        leading: Hero(
          tag: "add",
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ),
      ),
      body: Padding(
        padding: PaddingConstants.screenPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultForm(
                controller: expenseData.titleController,
                title: 'title',
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultDropdownButtonFormField<String>(

                    value: context
                        .watch<CategoryCubit>()
                        .state,
                    options: expenseData.categories,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<CategoryCubit>().changeCategory(value);
                      }
                    },
                    label: S.of(context).categories,
              ),

              const SizedBox(
                height: 20,
              ),
              DefaultForm(
                  controller: expenseData.amountController,
                  title: 'Amount',
                  inputType: TextInputType.number),
              const SizedBox(
                height: 20,
              ),
              DefaultDropdownButtonFormField<String>(
                value: context
                    .watch<CurrencyCubit>()
                    .state, // Get state from Cubit
                options: expenseData.currencies,
                onChanged: (value) {
                  if (value != null) {
                    context.read<CurrencyCubit>().changeCurrency(value);
                  }
                },
                label: S.of(context).currency,
              ),
              const SizedBox(
                height: 30,
              ),
              DefaultButton(
                onTap: () {
                  _handleSubmit();
                },
                title: 'Add Expense',
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     context.read<ExpenseBloc>().add(GetMonthlyExpenseEvent(
              //         DateTime.now().year,
              //         DateTime.now().month,
              //         'USD'));
              //   },
              //   child: Text('Get Monthly Expenses'),
              // ),
              // BlocBuilder<ExpenseBloc, ExpenseState>(
              //   builder: (context, state) {
              //     if (state is ExpenseLoading) {
              //       return CircularProgressIndicator();
              //     } else if (state is MonthlyExpenseLoaded) {
              //       return AnalysisPage(expenses: state.total);
              //     } else if (state is ExpenseError) {
              //       return Text('Error: ${state.message}',
              //           style: TextStyle(color: Colors.red));
              //     }
              //     return Container();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
