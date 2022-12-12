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
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Despesas')),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              child: Text('Inicio'),
              color: Colors.amber,
              elevation: 5,
            ),
          ),
          const Card(
            child: Text('Inicio'),
          ),
        ],
      ),
    );
  }
}
