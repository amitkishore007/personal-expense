import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final inputTitleController = TextEditingController();
  final inputAmountController = TextEditingController();
  DateTime _selectedDate;

  void _showCalendarWidget() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1971),
      lastDate: DateTime(2021),
      initialDate: DateTime.now(),
    ).then((date){
      this._selectedDate = date;
    });
  }

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
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  this._selectedDate == null ? 'Date not selected' :DateFormat.yMMMd().format(this._selectedDate),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Select a date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: this._showCalendarWidget,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: RaisedButton(
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              child: Text('Add New Transaction'),
              onPressed: () {
                widget.addTransaction(
                  this.inputTitleController.text,
                  this.inputAmountController.text,
                  this._selectedDate
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
