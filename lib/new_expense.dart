import 'package:flutter/material.dart';
import 'package:learning/models/expense.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense newExpense) onExpenseCreated;
  const NewExpense({super.key, required this.onExpenseCreated});
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();
  DateTime? _selectedDate;
  ExpenseCategory _selectedCategory = ExpenseCategory.clothes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          children: [
            TextField(
              maxLength: 50,
              controller: _titleInputController,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLength: 50,
                    controller: _amountInputController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Amount"),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? "No Date Selected"
                            : formatter.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.date_range),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: ExpenseCategory.values
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }
                  },
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: _createExpense,
                      child: const Text("Create Expense"),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // manage your controllers here
    _titleInputController.dispose();
    super.dispose();
  }

  // create expense
  void _createExpense() {
    // check if amount is valid
    bool amountIsInvalid = true;
    final enteredAmount = double.tryParse(_amountInputController.text);
    amountIsInvalid = _amountInputController.text.trim().isEmpty ||
        enteredAmount == null ||
        enteredAmount < 0;

    if (amountIsInvalid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Make sure all the values are valid!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }
    // create new expense
    widget.onExpenseCreated(
      Expense(
          title: _titleInputController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }
}
