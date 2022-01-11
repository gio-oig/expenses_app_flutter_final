import 'package:final_personal_express_app/data/model/expense_model.dart';
import 'package:final_personal_express_app/data/repository/expense_repository.dart';
import 'package:final_personal_express_app/provider/expense_provider.dart';
import 'package:final_personal_express_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddExpanse extends StatefulWidget {
  const AddExpanse({Key? key}) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<AddExpanse> {
  final TextEditingController idInputController = TextEditingController();
  final TextEditingController amountInputController = TextEditingController();
  final TextEditingController titleInputController = TextEditingController();

  void _showDataPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      if (value != null) {
        Provider.of<ExpenseProvider>(context, listen: false)
            .setFormatedDate(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final formatedDate = context.watch<ExpenseProvider>().formatedDate;

    return Container(
      color: const Color(0xffCEF7ED),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Column(
          children: [
            TextField(
              controller: idInputController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: -20.0),
                  hintText: 'Please enter expanse ID',
                  hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff707070).withOpacity(0.4)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            TextField(
              controller: amountInputController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: -20.0),
                  hintText: 'Please enter expanse amount',
                  hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff707070).withOpacity(0.4)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            TextField(
              controller: titleInputController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: -20.0),
                  hintText: 'Please enter expanse title',
                  hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff707070).withOpacity(0.4)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pick Date',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff707070)),
                ),
                CustomButton(
                  content: 'Pick Date',
                  onPress: _showDataPicker,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatedDate,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff707070)),
                ),
                CustomButton(
                  content: 'ADD',
                  onPress: () {
                    Expense newExpanse = Expense(
                        id: int.parse(idInputController.text),
                        expenseTitle: titleInputController.text,
                        amount: int.parse(amountInputController.text),
                        date: formatedDate);
                    context.read<ExpenseProvider>().createExpense(newExpanse);
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
