import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double _spendingAmount;
  final double _spendingPerOfTotal;
  final String _label;

  ChartBar(this._label, this._spendingAmount, this._spendingPerOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text('\$${this._spendingAmount.toStringAsFixed(0)}'),
        ),
        Container(
          height: 80,
          child: Stack(
            children: <Widget>[
              Container(
                height: 80,
                width: 10,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 220, 220, 1),
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: this._spendingPerOfTotal,
                child: Container(
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Text(this._label),
        )
      ],
    );
  }
}
