import 'package:final_personal_express_app/data/model/expense_model.dart';
import 'package:final_personal_express_app/data/repository/expense_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ExpenseProvider extends ChangeNotifier {
  List<Expense> _expenses = [];
  int _totalAmount = 0;
  String _formatedDate = '';

  String get formatedDate => _formatedDate;
  int get totalAmount => _totalAmount;
  List<Expense> get expenses => _expenses;

  Future<void> getExpenses() async {
    _expenses = await ExpenseRepository().fetchExpanses();
    setoTotal();
    notifyListeners();
  }

  Future<void> createExpense(Expense expense) async {
    await ExpenseRepository().createExpense(expense);
    _expenses.add(expense);
    _formatedDate = '';
    notifyListeners();
  }

  Future<void> updateExpense(Expense expense) async {
    await ExpenseRepository().updateExpense(expense);
    _expenses[_expenses.indexWhere((element) => element.id == expense.id)] =
        expense;
    setoTotal();
    notifyListeners();
  }

  Future<void> deleteExpense(id) async {
    try {
      await ExpenseRepository().removeExpense(id);
      _expenses = _expenses.where((element) => element.id != id).toList();
      setoTotal();
      notifyListeners();
    } catch (e) {}
  }

  void setoTotal() {
    _totalAmount = Expense.getTotalAmount(_expenses);
  }

  void setFormatedDate(DateTime date) {
    final formatedDate = DateFormat('d/M/y').format(date);
    _formatedDate = formatedDate;
    notifyListeners();
  }
}
