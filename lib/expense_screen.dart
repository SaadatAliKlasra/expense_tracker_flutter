import 'package:flutter/material.dart';
import 'package:learning/expense_list.dart';
import 'package:learning/models/expense.dart';
import 'package:learning/new_expense.dart';

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

  void addNewExpense(Expense newExpense) {
    setState(() {
      expenses.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("No expense found, try adding some!"),
    );
    if (expenses.isNotEmpty) {
      content = ExpenseList(
        expenses: expenses,
        onRemovingExpense: removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }

  void removeExpense(Expense expense) {
    final expenseIndex = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(_undoSnackbar(
      expenseIndex,
      expense,
    ));
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onExpenseCreated: addNewExpense),
    );
  }

  SnackBar _undoSnackbar(int index, Expense expense) {
    return SnackBar(
      content: const Text("Expense deleted!"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          setState(() {
            expenses.insert(index, expense);
          });
        },
      ),
    );
  }
}
