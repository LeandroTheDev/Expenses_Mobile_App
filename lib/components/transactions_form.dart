import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if(title.isEmpty || value <= 0){
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  fontFamily: 'koulen',
                ),
                controller: titleController,
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(
                  labelText: "Title",
                ),
              ),
              TextField(
                style: TextStyle(
                  fontFamily: 'koulen',
                ),
                controller: valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(
                  labelText: "Price R\$",
                ),
              ),
              TextButton(
                child: Text(
                  "New Transaction",
                  style: TextStyle(
                    fontFamily: 'koulen',
                  ),
                ),
                style: TextButton.styleFrom(primary: Colors.purpleAccent),
                onPressed: _submitForm,
              )
            ],
          ),
        ));
  }
}
