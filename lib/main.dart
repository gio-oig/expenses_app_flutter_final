import 'package:final_personal_express_app/provider/expense_provider.dart';
import 'package:final_personal_express_app/provider/update_expense_provider.dart';
import 'package:final_personal_express_app/screen/auth_screen.dart';
import 'package:final_personal_express_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ExpenseProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => UpdateExpenseProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(bodyText2: GoogleFonts.poppins())),
      initialRoute: AuthScreen.route,
      routes: {
        AuthScreen.route: (_) => const AuthScreen(),
        HomeScreen.route: (_) => const HomeScreen()
      },
    );
  }
}
