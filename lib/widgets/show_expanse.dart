import 'package:final_personal_express_app/data/model/expense_model.dart';
import 'package:final_personal_express_app/provider/expense_provider.dart';
import 'package:final_personal_express_app/widgets/circle_icon_button.dart';
import 'package:final_personal_express_app/widgets/update_expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ShowExpanse extends StatefulWidget {
  final Expense prop;
  const ShowExpanse({Key? key, required this.prop}) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<ShowExpanse> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.parse(widget.prop.date);
    final formatedDate = DateFormat('d/M/y').format(now);

    return Container(
      color: const Color(0xffCEF7ED),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              widget.prop.expenseTitle,
              style: const TextStyle(
                  color: Color(0xff707070),
                  fontWeight: FontWeight.w600,
                  fontSize: 27),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Expanse Amount',
                    style: TextStyle(
                        color: Color(0xff707070),
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
                Text('${widget.prop.amount}\$',
                    style: const TextStyle(
                        color: Color(0xff707070),
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Date:',
                    style: TextStyle(
                        color: Color(0xff707070),
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
                Text(formatedDate,
                    style: const TextStyle(
                        color: Color(0xff707070),
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
              ],
            ),
            const SizedBox(
              height: 99,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleIconButton(
                    padding: const EdgeInsets.all(20),
                    icon: const Icon(
                      Icons.edit,
                      size: 30,
                    ),
                    onPress: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return UpdateExpanse(
                            expense: widget.prop,
                          );
                        },
                      );
                    }),
                CircleIconButton(
                    padding: const EdgeInsets.all(20),
                    icon: const Icon(Icons.delete),
                    onPress: () => showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text('Accept'),
                              content:
                                  const Text('Do you whant to delete expense'),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'cansel'),
                                    child: const Text('Cancel')),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<ExpenseProvider>()
                                        .deleteExpense(widget.prop.id);
                                    Navigator.pop(context, 'OK');
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                )
                              ],
                            )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
