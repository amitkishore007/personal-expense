import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _latestTransactions;

  Chart(this._latestTransactions);

  List<Map<String, Object>> get _groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSpending = 0.0;
      for (var i = 0; i < this._latestTransactions.length; i++) {
        if (this._latestTransactions[i].date.day == weekDay.day &&
            this._latestTransactions[i].date.month == weekDay.month &&
            this._latestTransactions[i].date.year == weekDay.year) {
          totalSpending += this._latestTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSpending
      };
    }).reversed.toList();
  }

  double get _totalSpending {
    return this._groupedTransactions.fold(0.0, (sum, tx) {
      return sum += tx['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(this._totalSpending);
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 6,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: this._groupedTransactions.map((tx) {
              return ChartBar(
                tx['day'],
                tx['amount'],
                this._totalSpending == 0 ? 0.0 : (tx['amount'] as double)/ this._totalSpending,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
