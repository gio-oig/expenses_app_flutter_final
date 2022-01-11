import 'package:final_personal_express_app/provider/expense_provider.dart';
import 'package:final_personal_express_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  static String route = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 119.11,
            ),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              width: 189,
              child: ElevatedButton(
                  onPressed: () {
                    Provider.of<ExpenseProvider>(context, listen: false)
                        .getExpenses();
                    Navigator.pushNamed(context, HomeScreen.route);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color(0xffA8E3E8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 189,
              child: ElevatedButton(
                  onPressed: () {
                    Provider.of<ExpenseProvider>(context, listen: false)
                        .getExpenses();
                    Navigator.pushNamed(context, HomeScreen.route);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color(0xffA8E3E8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
