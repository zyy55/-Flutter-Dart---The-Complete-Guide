import '../widgets/chart_bar.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactiosn;
  Chart(this.recentTransactiosn);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactiosn.length; i++) {
        if (recentTransactiosn[i].date.day == weekDay.day &&
            recentTransactiosn[i].date.month == weekDay.month &&
            recentTransactiosn[i].date.year == weekDay.year) {
          totalSum += recentTransactiosn[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(
      0.0,
      (sum, item) {
        return sum + item['amount'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return ChartBar(data['day'], data['amount'],
              (data['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
