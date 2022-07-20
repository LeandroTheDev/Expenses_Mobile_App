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
              color: Colors.red.withOpacity(0),
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
      
                    //Valores dos numeros a esquerda
                    child: Stack(
                      children: [
                        Text(
                          "R\$ ${tr.value.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontFamily: 'rubik',
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.5
                            ..color = Colors.white
                          ),
                        ),
                        Text(
                          "R\$ ${tr.value.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontFamily: 'rubik',
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.purple,
                          )),
                      ]),
                    padding: EdgeInsets.all(10),
                  ),
                  //Textos a direita
                  Column(

                    //Nome do item
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Stack(
                        children: [
                          Text(
                            tr.title,
                            style: TextStyle(
                              fontFamily: 'koulen',
                              fontSize: 20,
                              letterSpacing: 1.3,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1.8
                                ..color = Colors.white  
                            ),
                          ),
                          
                          Text(
                          tr.title,
                          style: TextStyle(
                            fontFamily: 'koulen',
                            fontSize: 20,
                            letterSpacing: 1.3,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        )],
                      ),
                      
                      //Data do item
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
