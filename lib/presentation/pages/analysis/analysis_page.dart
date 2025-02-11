part of 'import.dart';



class AnalysisPage extends StatefulWidget {

  const AnalysisPage({super.key,});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;
  String selectedCurrency = 'USD';

  @override
  void initState() {
    super.initState();
    _fetchExpenses();
  }

  void _fetchExpenses() {
    context.read<ExpenseBloc>().add(
      GetMonthlyExpenseEvent(selectedYear, selectedMonth, selectedCurrency),
    );
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
              context.read<ExpenseBloc>().add(LoadExpenses());
              context.pop();
            },
          ),
        ),
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
      return BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoading) {
            return CircularProgressIndicator();
          } else if (state is MonthlyExpenseLoaded) {
            return Column(
              children: [
                _buildFilters(state.total),
                const SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: PieChart(
                    PieChartData(
                      sections: _buildSections(state.total),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ExpenseError) {
            return Text('Error: ${state.message}',
                style: TextStyle(color: Colors.red));
          }
          return Container();
        },
      );
        },
      ),
    );
  }

  Widget _buildFilters(Map<String, double> total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropdownButton<int>(
          value: selectedYear,
          items: List.generate(5, (index) {
            int year = DateTime.now().year - index;
            return DropdownMenuItem(value: year, child: Text(year.toString()));
          }),
          onChanged: (year) {
            setState(() {
              selectedYear = year!;
              _fetchExpenses();
            });
          },
        ),
        DropdownButton<int>(
          value: selectedMonth,
          items: List.generate(12, (index) {
            return DropdownMenuItem(
              value: index + 1,
              child: Text(_monthName(index + 1)),
            );
          }),
          onChanged: (month) {
            setState(() {
              selectedMonth = month!;
              _fetchExpenses();
            });
          },
        ),
        DropdownButton<String>(
          value: selectedCurrency,
          items: ['USD', 'EUR', 'GBP', 'AED']
              .map((currency) => DropdownMenuItem(
            value: currency,
            child: Text(currency),
          ))
              .toList(),
          onChanged: (currency) {
            setState(() {
              selectedCurrency = currency!;
              _fetchExpenses();
            });
          },
        ),
      ],
    );
  }

  String _monthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  List<PieChartSectionData> _buildSections(Map<String, double> total) {
    final List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
    ];

    if (total.isEmpty) {
      return [];
    }

    int index = 0;
    return total.entries.map((entry) {
      final color = colors[index % colors.length];
      index++;

      final double value =
      entry.value.isFinite && entry.value > 0 ? entry.value : 0.01;

      return PieChartSectionData(
        color: color,
        value: value,
        title: '${entry.key}\n\$${value.toStringAsFixed(2)}',
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        radius: 50,
      );
    }).toList();
  }
}
