class Expense {
  final int? id;
  final String expenseTitle;
  final int amount;
  final String date;

  Expense(
      {this.id,
      required this.expenseTitle,
      required this.amount,
      required this.date});

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
      id: json['id'],
      expenseTitle: json['expenseTitle'],
      amount: json['amount'],
      date: json['date']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'expenseTitle': expenseTitle,
      'amount': amount,
      'date': date,
    };
  }

  static int getTotalAmount(List<Expense> expList) {
    var sum = 0;
    for (var exp in expList) {
      sum += exp.amount;
    }
    return sum;
  }
}
