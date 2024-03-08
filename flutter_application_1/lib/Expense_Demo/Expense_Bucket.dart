import 'package:flutter_application_1/Expense_Demo/Model/Expenses_Model.dart';

class ExpenseBucket {
  ExpenseBucket(this.category, this.expenses);

  ExpenseBucket.forCategory(List<ExpensesModel> allExpense, this.category)
      : expenses = allExpense.where((exp) => exp.category == category).toList();
  final List<ExpensesModel> expenses;
  final Category category;

  double get totalExpenses {
    double sum = 0;

    for (final exp in expenses) {
      sum += exp.amount;
    }

    return sum;
  }
}
