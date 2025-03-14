import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();

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
          TextField(
            maxLength: 50,
            controller: _amountInputController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("Amount"),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Close"),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_titleInputController.text);
                    print(_amountInputController.text);
                  },
                  child: const Text("Create Expense"))
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
}
