import 'package:flutter/material.dart';
import 'package:flutter_application_1/Expense_Demo/Model/Expenses_Model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expensse, {super.key});
  final ExpensesModel expensse;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(expensse.title),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Text("\$${expensse.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    Icon(CategoryIcons[expensse.category]),
                    const SizedBox(
                      width: 2.0,
                    ),
                    Text("${expensse.formattedDate}")
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
