import 'package:flutter/material.dart';
import 'package:flutter_application_1/Expense_Demo/Model/Expenses_Model.dart';
import 'package:flutter_application_1/Expense_Demo/expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.expenses, {super.key});
  final List<ExpensesModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: ((context, index) => ExpenseItem(expenses[index])));
  }
}
