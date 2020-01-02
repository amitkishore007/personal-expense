import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        title: 'New Shoes',
        amount: 1.8,
        id: DateTime.now().toIso8601String(),
        date: DateTime.now()),
    Transaction(
        title: 'Books',
        amount: 2.0,
        id: DateTime.now().toIso8601String(),
        date: DateTime.now()),
    Transaction(
        title: 'Laptop',
        amount: 33.99,
        id: DateTime.now().toIso8601String(),
        date: DateTime.now()),
    Transaction(
        title: 'Shirts',
        amount: 4.3,
        id: DateTime.now().toIso8601String(),
        date: DateTime.now()),
  ];

  final inputTitleController = TextEditingController();
  final inputAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expense'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.blue,
              elevation: 5,
              child: Text(
                'Chart area!',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  //List of input boxes
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: this.inputTitleController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, bottom: 10, top: 0),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: this.inputAmountController,
                    ),
                  ),
                  FlatButton(
                    textColor: Colors.purple,
                    child: Text('Add New Transaction'),
                    onPressed: (){},
                  )
                ],
              ),
            ),
            Column(
                children: this.transactions.map((tnx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.purple,
                        ),
                      ),
                      child: Text(
                        '\$${tnx.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tnx.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                         '${new DateFormat.yMMMd().add_Hms().format(tnx.date)}',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
