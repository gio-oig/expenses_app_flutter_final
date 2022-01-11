import 'package:final_personal_express_app/data/model/expense_model.dart';
import 'package:final_personal_express_app/provider/expense_provider.dart';
import 'package:final_personal_express_app/widgets/add_expense.dart';
import 'package:final_personal_express_app/widgets/circle_icon_button.dart';
import 'package:final_personal_express_app/widgets/list_item.dart';
import 'package:final_personal_express_app/widgets/show_expanse.dart';
import 'package:final_personal_express_app/widgets/top_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void getbottom(Expense exp) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ShowExpanse(
          prop: exp,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final expenses = context.watch<ExpenseProvider>().expenses;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              'assets/background.png',
            ),
            Positioned(
              top: 110,
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Personal Expanses',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff707070)),
                        ),
                        CircleIconButton(
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                            onPress: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AddExpanse();
                                },
                              );
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    TopCard(
                      totalAmount: context.read<ExpenseProvider>().totalAmount,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount:
                            context.watch<ExpenseProvider>().expenses.length,
                        itemBuilder: (context, index) {
                          final title = expenses[index].expenseTitle;
                          final date = expenses[index].date;
                          final amount = expenses[index].amount;
                          return ListItem(
                              onPress: () {
                                getbottom(expenses[index]);
                              },
                              title: title,
                              date: date,
                              amount: amount);
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
