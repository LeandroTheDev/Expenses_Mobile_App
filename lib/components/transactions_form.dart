import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

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
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}
