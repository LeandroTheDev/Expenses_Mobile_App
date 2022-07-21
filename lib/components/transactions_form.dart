// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit,
   {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  double cont = 50.0;

  final titleController = TextEditingController();

  final valueController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if(title.isEmpty || value <= 0){
      return;
    }
    widget.onSubmit(title, value, selectedDate);
  }

  _showDatePicker(){
    showDatePicker(context: context,
     initialDate: DateTime.now(),
     firstDate: DateTime(2021),
     lastDate: DateTime.now(),
     ).then((pickedDate){
      if(pickedDate == null){
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
     });
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
              SizedBox(
                height: cont,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'koulen',
                      ),
                      ),
                    ),
                    TextButton(
                      child: Text(
                      'Select Data',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'koulen',
                      ),
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.purple,
                      child: TextButton(
                        child: Text(
                          "New Transaction",
                          style: TextStyle(
                            fontFamily: 'koulen',
                          ),
                        ),
                        style: TextButton.styleFrom(primary: Colors.white),
                        onPressed: _submitForm,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
