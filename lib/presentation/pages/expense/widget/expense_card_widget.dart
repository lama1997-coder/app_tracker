part of 'import.dart';

class ExpenseCardWidget extends StatelessWidget {
  final double totalIncome;
  final double totalExpense;
  const ExpenseCardWidget(
      {super.key, required this.totalIncome, required this.totalExpense});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: ThemeDataProvider.mainAppColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultText(title:"Summary",
              fontWeight: FontWeight.bold,
               ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    DefaultText(title:"Income", ),
                    DefaultText(title:"\$${totalIncome.toStringAsFixed(2)}",
                        fontWeight: FontWeight.bold
                      )
                  ],
                ),
                Column(
                  children: [
                    DefaultText(title: "Expense",),
                    DefaultText(title: "\$${totalExpense.abs().toStringAsFixed(2)}",
                        fontWeight: FontWeight.bold)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
