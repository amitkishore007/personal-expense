import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [];

  addTransaction(String title, String amount) {
    if (title.isEmpty || amount.isEmpty) {
      return;
    }

    setState(() {
      var transaction = Transaction(
        amount: double.parse(amount),
        title: title,
        id: DateTime.now().toString(),
        date: DateTime.now(),
      );

      this.transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(this.addTransaction),
        this.transactions.length != 0
            ? (this.transactions)
            : Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('No transaction found!'),
              ),
      ],
    );
  }
}
