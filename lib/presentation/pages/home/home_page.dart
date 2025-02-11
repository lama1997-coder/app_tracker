part of 'import.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Dispatch the event to load expenses
    context.read<ExpenseBloc>().add(LoadExpenses());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpenseBloc, ExpenseState>(

      listener: (context, state) {
        if (state is ExpenseError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is ExpenseLoading) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              FloatingActionButton(
                heroTag: "add",
                onPressed: () => context.push('/expenseform'),
                child: Icon(Icons.add),
              ),
             const SizedBox(height: 20,),
              FloatingActionButton(
                onPressed: () => context.push('/expenseform'),
                child: Icon(Icons.analytics),
              ),
            ],
          ),
          appBar: HomeAppbar(
            totalExpense:
                state is ExpenseLoadedSuccess ? state.totalExpense : 0,
            totalIncome: state is ExpenseLoadedSuccess ? state.totalIncome : 0,
          ),
          body: Padding(
            padding: PaddingConstants.screenPadding,
            child: state is ExpenseLoadedSuccess
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      DefaultText(
                        title: "Transactions history",
                        color: ThemeDataProvider.backgroundDarkColor,
                      ),
                      state.expenses.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: state.expenses.length,
                                itemBuilder: (context, index) {
                                  final exp = state.expenses[index];
                                  return Slidable(
                                    endActionPane: ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {
                                            context.push('/expenseform',extra:{'index':index,'expense': exp} );
                                            // Handle edit action
                                          },
                                          backgroundColor: Color(0xFF7BC043),
                                          foregroundColor: Colors.white,
                                          icon: Icons.edit,
                                          label: S.of(context).edit,
                                        ),
                                        SlidableAction(
                                          onPressed: (context) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return CustomDialogBox(
                                                  title: S
                                                      .of(context)
                                                      .areYouSureToDelete,
                                                  onTap: () {
                                                    context.read<ExpenseBloc>().add(DeleteExpenseEvent(index));

                                                    Navigator.of(context).pop();

                                                  },
                                                );
                                              },
                                            );
                                          },
                                          backgroundColor:
                                              ThemeDataProvider.red,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete_outlined,
                                          label: S.of(context).delete,
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      title: DefaultText(
                                        title: exp.title,
                                        color: ThemeDataProvider
                                            .backgroundDarkColor,
                                      ),
                                      subtitle: DefaultText(
                                        title: "${exp.category} - ${exp.date}",
                                        color: ThemeDataProvider
                                            .greyLightThemeColor,
                                        size: 12,
                                      ),
                                      trailing: DefaultText(
                                        title:
                                            "\$${exp.amount.toStringAsFixed(2)} ${exp.currency}",
                                        style: TextStyle(
                                          color: exp.amount > 0
                                              ? Colors.green
                                              : Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : EmptyWidget(),
                    ],
                  )
                : Center(
                    child: Text(
                      "No data available",
                      style: TextStyle(
                        color: ThemeDataProvider.greyLightThemeColor,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

}
