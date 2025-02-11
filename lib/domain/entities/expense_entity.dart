class Expense {
  final String title;
  final String category;
  final double amount;
  final DateTime date;
  final String currency;  // NEW: Store the currency code (e.g., "USD", "AED")

  Expense({
    required this.category,
    required this.amount,
    required this.date,
    required this.currency,
    required this.title
  });


  // Convert Expense object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'amount': amount,
      'currency': currency,
      'date': date.toIso8601String(),
    };
  }

  // Create an Expense object from JSON
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      title: json['title'],
      category: json['category'],
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'],
      date: DateTime.parse(json['date']),
    );
  }
}


