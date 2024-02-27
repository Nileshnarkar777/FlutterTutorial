import 'package:flutter/material.dart';
import 'package:flutter_application_1/Expense_Demo/Model/Expenses_Model.dart';
import 'package:flutter_application_1/Expense_Demo/expense_list.dart';
import 'package:flutter_application_1/Expense_Demo/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpensesModel> _registeredExpenses = [
    ExpensesModel(
        title: "Flutter course",
        amount: 20.00,
        date: DateTime.now(),
        category: Category.work),
    ExpensesModel(
        title: "Cinema",
        amount: 25.00,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  _addnewExpenses() {
    showModalBottomSheet(
        context: context, builder: ((context) => const NewExpense()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense List"),
        actions: [
          IconButton(onPressed: _addnewExpenses, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(child: ExpenseList(_registeredExpenses)),
        ],
      ),
    );
  }
}
