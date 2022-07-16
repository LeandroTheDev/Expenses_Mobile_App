import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                ),
              ),
              TextField(
                controller: valueController,
                decoration: InputDecoration(
                  labelText: "Price R\$",
                ),
              ),
              TextButton(
                child: Text(
                  "New Transaction",
                ),
                style: TextButton.styleFrom(primary: Colors.purpleAccent),
                onPressed: () {
                  final title = titleController.text;
                  final value = double.tryParse(valueController.text) ?? 0.0;
                  onSubmit(title,value);
                },
              )
            ],
          ),
        ));
  }
}
