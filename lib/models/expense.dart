import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  // constructor class
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = const Uuid().v4();
}

enum ExpenseCategory {
  learning(
    Icons.school,
    Colors.blue,
  ),
  food(
    Icons.fastfood,
    Colors.orange,
  ),
  travel(
    Icons.airplanemode_active,
    Colors.green,
  ),
  clothes(
    Icons.checkroom,
    Colors.pink,
  ),
  others(
    Icons.more_horiz,
    Colors.grey,
  );

  // Fields for icon and color
  final IconData icon;
  final Color color;

  // Constructor for the enum values
  const ExpenseCategory(this.icon, this.color);
}
