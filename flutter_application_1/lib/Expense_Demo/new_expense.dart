import 'package:flutter/material.dart';
import 'package:flutter_application_1/Expense_Demo/Model/Expenses_Model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  final void Function(ExpensesModel) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  _showDatePicker() async {
    final todayDate = DateTime.now();
    final lastYearDate =
        DateTime(todayDate.year - 1, todayDate.month, todayDate.day);

    final selectedDate = await showDatePicker(
        context: context, firstDate: lastYearDate, lastDate: todayDate);

    setState(() {
      _selectedDate = selectedDate;
    });
  }

  _saveExpense() {
    final enterAmount = double.tryParse(_amountController.text);

    if (enterAmount == null ||
        enterAmount < 0.0 ||
        _titleController.text.isEmpty ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text(
              "You have to provide valid title, valid amount and valid date."),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("Ok"))
          ],
        ),
      );
      return;
    }

    widget.addExpense(ExpensesModel(
        amount: enterAmount,
        date: _selectedDate!,
        title: _titleController.text.trim(),
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              maxLength: 50,
              controller: _titleController,
              decoration: const InputDecoration(label: Text("Title")),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLength: 50,
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    decoration: const InputDecoration(
                        prefixText: "\$ ", label: Text("Amount")),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Select Date"
                          : dateFormatter.format(_selectedDate!),
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    IconButton(
                        onPressed: _showDatePicker,
                        icon: const Icon(Icons.calendar_today))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name.toString().toUpperCase())))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    }),
                const Spacer(),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel")),
                    TextButton(
                        onPressed: _saveExpense, child: const Text("Submit"))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
