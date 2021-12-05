import 'dart:math';

import 'package:flutter/material.dart';

import '../Models/TxModel.dart';
import '../Widgets/NewTx.dart';
import '../Widgets/TxList.dart';

class UserTransaction extends StatefulWidget {
  // UserTransaction({Key? key}) : super(key: key);
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<TxModel> _userTransactions = [
    TxModel(
      id: 't1',
      title: 'New Shoes',
      amount: 69.20,
      date: DateTime.now(),
    ),
    TxModel(
      id: 't1',
      title: 'Beli tempeh',
      amount: 12.40,
      date: DateTime.now(),
    )
  ];

  void _addNewTx(String txTitle, double txAmount) {
    final newTx = TxModel(
      id: Random().nextInt(5000).toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTx),
        TransactionList(
          allTransactions: _userTransactions,
        ),
      ],
    );
  }
}
