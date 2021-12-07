import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/TxModel.dart';
import '../Widgets/ChartBar.dart';

class Chart extends StatelessWidget {
  final List<TxModel> recentTransactions;

  Chart({required this.recentTransactions});

  List<Map<String, Object>> get weeklyTxValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var _totalSum = 0.0;

      for (var i = 0;i < recentTransactions.length; i ++ ){
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;
        if (sameDay && sameMonth && sameYear) {
          _totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0,3),
        'amount': _totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return weeklyTxValues.fold(0.0, (sum, item){
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: weeklyTxValues.map((data){
            // return Text('${data['day']}: ${data['amount']}');
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label:'${data['day']}' ,
                spendingAmount:( data['amount'] as double) ,
                spendingPctOfTotal: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
