import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final _weekDay = DateTime.now().subtract(
    Duration(days: 7),
  );
  final List<TxModel> _userTransactions = [
    TxModel(
      id: 't1',
      title: 'New Shoes',
      amount: 69.20,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    TxModel(
      id: 't1',
      title: 'Beli tempeh',
      amount: 12.40,
      date: DateTime.now().subtract(Duration(days: 3)),
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

  void _addNewTx(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = TxModel(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  bool counter = true;

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
            TransactionList(allTransactions: _userTransactions),
            ElevatedButton(onPressed: (){
              print(DateFormat.E().format(_weekDay).substring(0,3));
            }, child: Text('Test'),)
          ],
        ),
      ),
    );
  }
}
