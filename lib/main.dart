import 'package:expenses/models/Transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Despesas')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: const Card(
              child: Text('Inicio'),
              color: Colors.amber,
              elevation: 5,
            ),
          ),
          Column(
              children: _transactions.map(
            (tr) {
              return Card(
                  child: Row(
                children: [
                  Column(
                    children: [
                      Text(tr.title),
                      Text(
                        tr.date.toString(),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    padding: const EdgeInsets.all(10),
                    //decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: Text(tr.value.toString(), style: TextStyle(),),
                  ),
                ],
              ));
            },
          ).toList()),
        ],
      ),
    );
  }
}
