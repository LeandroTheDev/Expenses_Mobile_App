import 'package:flutter/cupertino.dart';
import 'transactions_form.dart';
import 'transactions_list.dart';
import '../models/transactions.dart';

class TransactionUser extends StatefulWidget {

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser>{

//Informações do Historico de compras
  final _transactions = [
    Transaction(
      id: "t1", 
      title: "Trunk", 
      value: 310.80, 
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2", 
      title: "Old Tire", 
      value: 2000.00, 
      date: DateTime.now(),
    ),
  ];


  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}