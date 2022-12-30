import 'dart:math';
import 'package:flutter/material.dart';

import '../components/transaction_form.dart';
import '../components/transaction_list.dart';
import '../models/Transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      't1',
      title: 'Conta de Luz',
      value: 120.20,
      date: DateTime.now(),
    ),
    Transaction(
      't2',
      title: 'Jaqueta',
      value: 150.00,
      date: DateTime.now(),
    ),
    Transaction(
      't3',
      title: 'Jaqueta',
      value: 150.00,
      date: DateTime.now(),
    ),
    Transaction(
      't4',
      title: 'Jaqueta',
      value: 150.00,
      date: DateTime.now(),
    ),
    Transaction(
      't5',
      title: 'Jaqueta',
      value: 150.00,
      date: DateTime.now(),
    ),
    Transaction(
      't6',
      title: 'Jaqueta',
      value: 150.00,
      date: DateTime.now(),
    ),
    Transaction(
      't7',
      title: 'Jaqueta',
      value: 150.00,
      date: DateTime.now(),
    ),
    Transaction(
      't8',
      title: 'Jaqueta',
      value: 150.00,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(onSubmit: _addTransaction),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
