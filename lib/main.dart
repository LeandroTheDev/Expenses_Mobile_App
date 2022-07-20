// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:projeto/components/transactions_form.dart';
import 'dart:math';
import 'components/transactions_form.dart';
import 'components/transactions_list.dart';
import '../models/transactions.dart';

//Inicialização do Aplicativo
void main() {
  runApp(Expense());
}

//Chamada da Página Inicial para a função Aplicativo
class Expense extends StatelessWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
      home: HomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.purple,
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'koulen',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'koulen',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

//Criação da Página Inicial
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Informações do Historico de compras
  final List<Transaction> _transactions = [];

  //Codigo para adicionar uma transação nova
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  //Metodo para chamar a pagina de adicionar transações
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    //Criação da barra de cima
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Money"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),

      //Criação da coluna
      body: Container(
        height: 1000,
        width: 1000,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/waiting.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Criação do grafico
              Card(
                color: Colors.purple,
                child: Text("Table"),
                elevation: 5,
              ),
              TransactionList(_transactions),
            ],
          ),
        ),
      ),

      //Botão para chamar adicionar transações
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
