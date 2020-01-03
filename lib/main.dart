import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

    Navigator.of(context).pop();
  }

  startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(this.addTransaction),
          onTap: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              this.startNewTransaction(context);
            },
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                color: Colors.blue,
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Chart area!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              this.transactions.length != 0
                  ? TransactionList(this.transactions)
                  : Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 20),
                      child: Text('No transaction found!'),
                    )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          this.startNewTransaction(context);
        },
      ),
    );
  }
}
