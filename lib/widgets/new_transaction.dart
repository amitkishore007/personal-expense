import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final inputTitleController = TextEditingController();
  final inputAmountController = TextEditingController();
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
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
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: this.inputAmountController,
            ),
          ),
          FlatButton(
            textColor: Colors.purple,
            child: Text('Add New Transaction'),
            onPressed: () {
              this.addTransaction(
                this.inputTitleController.text,
                this.inputAmountController.text,
              );
            },
          )
        ],
      ),
    );
  }
}
