import 'package:final_personal_express_app/data/model/expense_model.dart';
import 'package:final_personal_express_app/provider/expense_provider.dart';
import 'package:final_personal_express_app/provider/update_expense_provider.dart';
import 'package:final_personal_express_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UpdateExpanse extends StatefulWidget {
  final Expense expense;
  const UpdateExpanse({Key? key, required this.expense}) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<UpdateExpanse> {
  late TextEditingController idInputController = TextEditingController();
  late TextEditingController amountInputController = TextEditingController();
  late TextEditingController titleInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    idInputController =
        TextEditingController(text: widget.expense.id.toString());
    amountInputController =
        TextEditingController(text: widget.expense.amount.toString());
    titleInputController =
        TextEditingController(text: widget.expense.expenseTitle);
    DateTime saved = DateTime.parse(widget.expense.date);

    void _showDataPicker() {
      int saved = DateTime.parse(widget.expense.date).year;
      showDatePicker(
              context: context,
              initialDate: DateTime(saved),
              firstDate: DateTime(2000),
              lastDate: DateTime(2025))
          .then((value) {
        if (value != null) {
          Provider.of<UpdateExpenseProvider>(context, listen: false)
              .setFormatedDate(value);
        }
      });
    }

    return Container(
      color: const Color(0xffCEF7ED),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TextField(
              controller: idInputController,
              decoration: const InputDecoration(
                  hintText: 'expanse ID',
                  contentPadding: EdgeInsets.only(bottom: -10.0),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            TextField(
              controller: amountInputController,
              decoration: const InputDecoration(
                  hintText: 'expanse amount',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            TextField(
              controller: titleInputController,
              decoration: const InputDecoration(
                  hintText: 'expanse title',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (context.watch<UpdateExpenseProvider>().formatedDate != '')
                    ? Text(context.watch<UpdateExpenseProvider>().formatedDate)
                    : Text(DateFormat('d/M/y').format(saved)),
                CustomButton(
                  content: 'Pick Date',
                  onPress: _showDataPicker,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  content: 'EDIT',
                  onPress: () {
                    Expense updatedExpense = Expense(
                        id: int.tryParse(idInputController.text),
                        expenseTitle: titleInputController.text,
                        amount: int.parse(amountInputController.text),
                        date:
                            context.read<UpdateExpenseProvider>().formatedDate);

                    context
                        .read<ExpenseProvider>()
                        .updateExpense(updatedExpense);

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
