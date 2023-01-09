import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.recentTransactions,
  });

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        double totalSum = 0.0;

        for (var i = 0; i < recentTransactions.length; i++) {
          bool sameDay = recentTransactions[i].date.day == weekDay.day;
          bool sameMonth = recentTransactions[i].date.month == weekDay.month;
          bool sameYear = recentTransactions[i].date.month == weekDay.month;

          if (sameDay && sameMonth && sameYear) {
            totalSum += recentTransactions[i].value;
          }
        }
        return {
          'day': DateFormat.E().format(weekDay)[0],
          'value': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(
      0.0,
      (previousValue, tr) => previousValue + (tr['value'] as double),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr['day'].toString(),
                value: (tr['value'] as double),
                percentage: (tr['value'] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
