import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({
    super.key,
    required this.onSubmit,
  });

  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final Function(String, double) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Titulo',
            ),
          ),
          TextField(
            controller: valueController,
            decoration: const InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),
          ElevatedButton(
            child: const Text('Salvar'),
            onPressed: () {
              final title = titleController.text;
              final value = double.tryParse(valueController.text) ?? 0.0;
              onSubmit(title, value);
            },
          ),
        ]),
      ),
    );
  }
}
