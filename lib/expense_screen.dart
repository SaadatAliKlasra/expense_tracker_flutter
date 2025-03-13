import 'package:flutter/material.dart';
import 'package:learning/expense_list.dart';
import 'package:learning/models/expense.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final expenses = [
    Expense(
      title: 'learning flutter',
      amount: 3.33,
      date: DateTime.now(),
      category: ExpenseCategory.clothes,
    ),
    Expense(
      title: 'buying eggs',
      amount: 23.33,
      date: DateTime.now(),
      category: ExpenseCategory.food,
    ),
    Expense(
      title: 'going to lahore',
      amount: 33.33,
      date: DateTime.now(),
      category: ExpenseCategory.travel,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ExpenseList(
        expenses: expenses,
      ),
    );
  }
}
