part of 'import.dart';



class AnalysisPage extends StatelessWidget {
  final Map<String, double> expenses;

  const AnalysisPage({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        // Pie Chart
        SizedBox(
          height: 300,
          child: PieChart(
            PieChartData(
              sections: _buildPieSections(),
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
              centerSpaceRadius: 40,
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Bar Chart
        SizedBox(
          height: 300,
          child: BarChart(
            BarChartData(
              barGroups: _buildBarGroups(),
              titlesData: _buildBarTitles(),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
            ),
          ),
        ),
      ],
    );
  }

  // Build Pie Chart sections
  List<PieChartSectionData> _buildPieSections() {
    final List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
    ];

    int index = 0;
    return expenses.entries.map((entry) {
      final color = colors[index % colors.length];
      index++;
      return PieChartSectionData(
        color: color,
        value: entry.value,
        title: '${entry.key}\n\$${entry.value.toStringAsFixed(2)}',
        titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        radius: 50,
      );
    }).toList();
  }

  // Build Bar Chart groups
  List<BarChartGroupData> _buildBarGroups() {
    int index = 0;
    return expenses.entries.map((entry) {
      return BarChartGroupData(
        x: index++,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            color: Colors.blueAccent,
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();
  }

  // Build Bar Chart titles
  FlTitlesData _buildBarTitles() {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 50, // Adjust based on your values
          reservedSize: 40,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (double value, TitleMeta meta) {
            final categories = expenses.keys.toList();
            return Container();
            //   SideTitleWidget(
            //   axisSide: meta.axisSide,
            //   child: Text(
            //     categories[value.toInt()],
            //     style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            //   ),
            // );
          },
          reservedSize: 40,
        ),
      ),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}

// class AnalysisPage extends StatelessWidget {
//   final Map<String, double> expenses;
//
//   const AnalysisPage({super.key, required this.expenses});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: PieChart(
//         PieChartData(
//           sections: _buildSections(),
//           borderData: FlBorderData(show: false),
//           sectionsSpace: 2,
//           centerSpaceRadius: 40, // Adjust center space
//         ),
//       ),
//     );
//   }
//
//   List<PieChartSectionData> _buildSections() {
//     final List<Color> colors = [
//       Colors.blue,
//       Colors.green,
//       Colors.orange,
//       Colors.red,
//       Colors.purple,
//     ];
//
//     int index = 0;
//     return expenses.entries.map((entry) {
//       final color = colors[index % colors.length];
//       index++;
//       return PieChartSectionData(
//         color: color,
//         value: entry.value,
//         title: '${entry.key}\n\$${entry.value.toStringAsFixed(2)}',
//         titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
//         radius: 50, // Adjust size
//       );
//     }).toList();
//   }
// }
