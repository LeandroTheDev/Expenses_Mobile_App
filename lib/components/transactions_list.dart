// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions;

  TransactionList(this.transactions,
   {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //Criação do Historico de compras
        //Bloco 2
    SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
            return Card(
              margin: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
              color: Color.fromARGB(0, 184, 33, 243),
              elevation: 0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FittedBox(
                      child: Text(
                        tr.value.toStringAsFixed(2)
                      ),
                    ),
                  ),
                ),
                title: Stack(
                  children: [
                    Text(
                      tr.title,
                      style: TextStyle(
                        fontFamily: 'rubik',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1.5
                        ..color = Colors.white
                      ),
                      ),
                    Text(
                      tr.title,
                      style: TextStyle(
                        fontFamily: 'rubik',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  DateFormat('d MMM y').format(tr.date),  
                  style: TextStyle(
                    fontFamily: 'koulen',
                    color: Colors.black,
                  ),
                ),
              ),
            );
         },
        ),
      );
  }
}
