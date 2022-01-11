import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:final_personal_express_app/data/model/expense_model.dart';

class ExpenseRepository {
  Dio dio = Dio();

  Future<List<Expense>> fetchExpanses() async {
    List<Expense> expanseList = [];
    final response = await dio.get('http://10.0.2.2:8080/expenses');

    if (response.statusCode == 200) {
      var loadedExpanses = <Expense>[];
      response.data.forEach((expanse) {
        Expense expanseModel = Expense.fromJson(expanse);
        loadedExpanses.add(expanseModel);
      });
      expanseList = loadedExpanses;
    }
    // print(expanseList);
    return expanseList;
  }

  Future<void> createExpense(Expense expense) async {
    try {
      final response = await dio.post(
        'http://10.0.2.2:8080/add-expense',
        data: jsonEncode(expense.toMap()),
      );

      if (response.statusCode == 200) {
        // Expense a = Expense.fromJson(response.data as Map<String, dynamic>);
        // return a;
      } else {
        throw Exception('Failed to create');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateExpense(Expense expense) async {
    try {
      final response = await dio.put(
        'http://10.0.2.2:8080/update-expense',
        data: jsonEncode(expense.toMap()),
      );

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to create');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeExpense(id) async {
    await dio.delete('http://10.0.2.2:8080/delete-expense/${id}');
  }
}
