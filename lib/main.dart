import 'package:flutter/material.dart';

void main() {
  runApp(Expense());
}


class Expense extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinheiro"),
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.purple,
              child: Text("Tabela"),
              elevation: 5,
            ),
          ),
          Card(
            color: Colors.purple,
            child: Text("Lista de Compras"),
          ),
        ],
      ),
    );
  }
}