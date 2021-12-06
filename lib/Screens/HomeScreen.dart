import 'dart:math';
import 'package:flutter/material.dart';
import 'package:totalspense/Widgets/NewTx.dart';


import '../Models/TxModel.dart';
import '../Widgets/Chart.dart';
import '../Widgets/TxList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final List<TxModel> transactions = [];
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
    ),
  ];
  List<TxModel> get _last7DaysTx {
    return _userTransactions.where((tx) {
      final today = DateTime.now();
      final sevenDays = Duration(days: 7);

      return tx.date.isAfter(today.subtract(sevenDays));
    }).toList();
  }

  void _startAddNewTx(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (bCtx){
      return GestureDetector(
        onTap: (){},
        behavior: HitTestBehavior.opaque,
        child: NewTransaction(
          addTxHandler: _addNewTx,
        ),
      );
    });
  }

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
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTx(context),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransactions: _last7DaysTx,),
            TransactionList(allTransactions: _userTransactions)
          ],
        ),
      ),
    );
  }
}
