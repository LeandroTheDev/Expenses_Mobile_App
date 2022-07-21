// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:projeto/components/transactions_form.dart';
import 'dart:math';
import 'components/transactions_form.dart';
import 'components/transactions_list.dart';
import '../models/transactions.dart';
import 'components/chart.dart';

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


  //Verifica se as transações são do periodo de uma semana
  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  //Codigo para adicionar uma transação nova
  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
    _transactions.removeWhere((tr) {
      return tr.id == id;
      });
    });
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
              Chart(_recentTransactions),
              //Criação do historico
              TransactionList(_transactions, _removeTransaction),
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
