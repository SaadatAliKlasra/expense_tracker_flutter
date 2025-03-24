import 'package:flutter/material.dart';
import 'package:learning/expense_item.dart';
import 'package:learning/models/expense.dart';

class ExpenseList extends StatelessWidget {
  // variables
  final List<Expense> expenses;
  final void Function(Expense expense) onRemovingExpense;
  // constructor
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemovingExpense,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(
        expenseItem: expenses[index],
        onRemovingExpense: onRemovingExpense,
      ),
    );
  }
}
