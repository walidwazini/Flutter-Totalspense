import 'package:flutter/material.dart';

import '../Models/TxModel.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<TxModel> recentTransactions;

  Chart({required this.recentTransactions});

  List<Map<String, Object>> get weeklyTxValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double _totalSum = 0.0;

      for (var i = 0;i < recentTransactions.length; i ++ ){
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;
        if (sameDay && sameMonth && sameYear) {
          _totalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(_totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0,4),
        'amount': _totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(20),
      child: Row(
        children: weeklyTxValues.map((data){
          return Text('${data['day']}: ${data['amount']}');
        }).toList(),
      ),
    );
  }
}
