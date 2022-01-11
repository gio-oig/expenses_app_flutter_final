import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class UpdateExpenseProvider extends ChangeNotifier {
  String _formatedDate = '';

  String get formatedDate => _formatedDate;

  void setFormatedDate(DateTime date) {
    final formatedDate = DateFormat('d/M/y').format(date);
    _formatedDate = formatedDate;
    notifyListeners();
  }
}
