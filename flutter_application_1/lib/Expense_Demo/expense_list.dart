import 'package:flutter/material.dart';
import 'package:flutter_application_1/Expense_Demo/Model/Expenses_Model.dart';
import 'package:flutter_application_1/Expense_Demo/expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.expenses, this.onRemove, {super.key});
  final List<ExpensesModel> expenses;
  final Function(ExpensesModel expense) onRemove;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: ((context, index) => Dismissible(
            key: ValueKey(expenses[index]),
            onDismissed: (direction) => onRemove(expenses[index]),
            child: ExpenseItem(expenses[index]))));
  }
}
