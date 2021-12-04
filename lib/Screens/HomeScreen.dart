import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              children: [
                Card(
                  child: Text('Transaction'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
