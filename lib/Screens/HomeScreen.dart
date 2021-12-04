import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/TransactionModel.dart';

class HomeScreen extends StatelessWidget {
  final List<TransactionModel> transactions = [
    TransactionModel(
      id: 't1',
      title: 'New Shoes',
      amount: 69.20,
      date: DateTime.now(),
    ),
    TransactionModel(
      id: 't1',
      title: 'Beli tempeh',
      amount: 12.40,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 10,
              child: Container(
                width: 200,
                child: Text('Chart'),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        child: Text(
                          ' RM ${tx.amount.toString()} ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        padding: EdgeInsets.all(10),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              tx.title!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                              ),
                            ),
                            Text(
                              DateFormat('dd-MM-yyyy').format(tx.date),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15
                              ),
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
