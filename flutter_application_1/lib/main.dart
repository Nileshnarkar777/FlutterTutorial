import 'package:flutter/material.dart';
import 'package:flutter_application_1/Roll_DIce_Demo/gradient_container.dart';

import 'Expense_Demo/expenses_demo.dart';
import 'Expense_Demo/new_expense.dart';
import 'Quzz_Demo/quzz_demo_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  _addnewExpenses(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: ((context) => const NewExpense()));
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text("My App"),
        //   // backgroundColor: const Color.fromARGB(255, 71, 5, 124),
        //   // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        // ),

        body: const Expenses(), //add this when run expenses demo
        // body: const Quiz(), //add this when run quzz demo
        // body: const GradientContainer(), //add this when run roll dice demo
      ),
    );
  }
}
