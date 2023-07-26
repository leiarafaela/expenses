import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.transactions,
    required this.onRemove,
  });

  final List<Transaction> transactions;
  final Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactionsList = List.from(transactions.reversed);

    return transactionsList.isEmpty
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('Nenhuma despesa cadastrada',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Image.asset(
                'assets/images/waiting.png',
                width: 200,
                height: 200,
              ),
            ],
          )
        : ListView.builder(
            itemCount: transactionsList.length,
            itemBuilder: (context, index) {
              final tr = transactionsList[index];
              return Card(
                elevation: 0,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text(
                          'R\$${tr.value}',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    DateFormat('dd MMM y').format(tr.date),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => onRemove(tr.id),
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              );
            },
          );
  }
}
