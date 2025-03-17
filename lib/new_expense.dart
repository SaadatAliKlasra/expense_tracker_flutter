import 'package:flutter/material.dart';
import 'package:learning/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
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
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Close"),
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Create Expense"))
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // manage your controllers here
    _titleInputController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1);
    final dateResponse = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = dateResponse;
    });
  }
}
