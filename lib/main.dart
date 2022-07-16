import 'package:flutter/material.dart';
import 'components/transactions_user.dart';

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

  @override
  Widget build(BuildContext context){
    //Criação da barra de cima
    return Scaffold(
      appBar: AppBar(
        title: Text("Money"),
      ),


      //Criação da coluna
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Criação dos blocos
            //Bloco 1
            Container(
              child: Card(
                color: Colors.purple,
                child: Text("Table"),
                elevation: 5,
              ),
            ),
            //Chamada do sistema
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}