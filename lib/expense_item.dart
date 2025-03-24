import 'package:flutter/material.dart';
import 'package:learning/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  // vars
  final Expense expenseItem;
  final void Function(Expense expense) onRemovingExpense;
  // constructor
  const ExpenseItem({
    required this.expenseItem,
    required this.onRemovingExpense,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(expenseItem),
      onDismissed: (direction) {
        onRemovingExpense(expenseItem);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: expenseItem.category.color,
              child: Icon(
                expenseItem.category.icon,
                color: Colors.white,
              ),
            ),
            title: Text(
              expenseItem.category.toString().split('.').last,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(expenseItem.title),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '\$',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      expenseItem.amount.toStringAsFixed(2),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Text(expenseItem.formattedDate)
              ],
            )),
      ),
    );
  }
}
