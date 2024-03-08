import 'package:flutter/material.dart';
import 'package:flutter_application_1/Expense_Demo/Chart/chart.dart';
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
        context: context,
        builder: ((context) => NewExpense(addExpense: _saveNewExpense)));
  }

  _saveNewExpense(ExpensesModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  _removeExpense(ExpensesModel expense) {
    int index = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Deleted"),
      duration: const Duration(milliseconds: 3),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            _registeredExpenses.insert(index, expense);
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainWidget = _registeredExpenses.isEmpty
        ? const Center(child: Text("No expense added please add one."))
        : ExpenseList(_registeredExpenses, _removeExpense);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense List"),
        actions: [
          IconButton(onPressed: _addnewExpenses, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainWidget),
        ],
      ),
    );
  }
}
