import 'package:flutter/material.dart';
import 'dart:math';

import '/components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Color.fromARGB(255, 33, 194, 113),
          secondary: Color.fromARGB(255, 9, 95, 55),
        ),
        textTheme: theme.textTheme.copyWith(
          headline1: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline6: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        scaffoldBackgroundColor: Colors.grey[200],
        //cardColor: Colors.grey[200],
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      't0',
      title: 'Cartão de crédito',
      value: 2000.00,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Transaction(
      't1',
      title: 'Conta de Luz',
      value: 120.20,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      't2',
      title: 'Jaqueta',
      value: 150.00,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Transaction(
      't3',
      title: 'Internet',
      value: 120.00,
      date: DateTime.now(),
    ),
    Transaction(
      't4',
      title: 'Lanche',
      value: 55.00,
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
    Transaction(
      't5',
      title: 'Tenis',
      value: 250.00,
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
    Transaction(
      't6',
      title: 'Cartão de Itau',
      value: 2000.00,
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Transaction(
      't7',
      title: 'Pizza',
      value: 100.00,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      Random().nextDouble().toString(),
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
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBar = AppBar(
      title: const Center(child: Text('Minhas Despesas')),
      actions: [
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: const Icon(Icons.add),
        )
      ],
    );

    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        statusBarHeight;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: availableHeight * 0.30,
              child: Chart(recentTransactions: _recentTransactions),
            ),
            Container(
              height: availableHeight * 0.70,
              child: TransactionList(
                transactions: _transactions,
                onRemove: _removeTransaction,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
