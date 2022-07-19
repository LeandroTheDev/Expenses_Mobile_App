import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return //Criação do Historico de compras
        //Bloco 2
    Container(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
            return Card(
              child: Row(
                children: [
                  Container(
                    //Numeros a esquerda
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
      
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.purple,
                      width: 4,
                    )),
      
                    //Textos da direita
                    child: Text("R\$ ${tr.value.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontFamily: 'rubik',
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.purple,
                        )),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr.title,
                        style: TextStyle(
                          fontFamily: 'koulen',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('d MMM y').format(tr.date),
                        style: TextStyle(
                          fontFamily: 'koulen',
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
         },
        ),
      );
  }
}
