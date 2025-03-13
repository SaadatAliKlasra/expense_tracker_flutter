import 'package:flutter/material.dart';
import 'package:learning/expense_screen.dart';

void main() {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Expense Tracker",
      home: ExpenseScreen(),
    );
  }
}
