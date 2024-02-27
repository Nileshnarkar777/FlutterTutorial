import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final dateFormatter = DateFormat.yMd();

enum Category { work, travel, food, leisure }

const CategoryIcons = {
  Category.work: Icons.work,
  Category.travel: Icons.flight_takeoff,
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
};

class ExpensesModel {
  const ExpensesModel(
      {required this.amount,
      required this.date,
      required this.title,
      required this.category})
      : id = "";

  final String title;
  final DateTime date;
  final double amount;
  final String id;
  final Category category;

  get formattedDate {
    return dateFormatter.format(date);
  }
}
