import 'package:flutter/material.dart';
import 'package:projeto/models/transactions.dart';
import 'package:intl/intl.dart';

//Inicialização do Aplicativo
void main() {
  runApp(Expense());
}



//Chamada da Página Inicial para a função Aplicativo
class Expense extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomePage()
    );
  }
}

//Criação da Página Inicial
class HomePage extends StatelessWidget {

//Informações do Historico de compras
  final _transactions = [
    Transaction(
      id: "t1", 
      title: "Porta Malas", 
      value: 310.80, 
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2", 
      title: "Pneu Velho", 
      value: 2000.00, 
      date: DateTime.now(),
    ),
  ];



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinheiro"),
      ),


      //Criação da coluna
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Criação dos blocos
          //Bloco 1
          Container(
            child: Card(
              color: Colors.purple,
              child: Text("Tabela"),
              elevation: 5,
            ),
          ),


          //Criação do Historico de compras
          //Bloco 2
          Column(
            children: _transactions.map((tr) {
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
                        width: 2,
                      )
                    ),

                    //Textos da direita
                    child: Text(
                      "R\$ ${tr.value.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      )
                    ),
                  padding: EdgeInsets.all(10),
                  ),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [                   
                      Text(tr.title,
                        style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(DateFormat('d MMM y').format(tr.date),
                        style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],

                  )
                ],
              ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}