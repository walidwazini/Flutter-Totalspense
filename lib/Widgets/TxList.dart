import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/TxModel.dart';

class TransactionList extends StatelessWidget {
  //const TransactionList({Key? key}) : super(key: key);
  final List<TxModel> allTransactions;
  final Function deleteTx;

  TransactionList({required this.allTransactions, required this.deleteTx});

  Widget txAmount({int? ind}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      child: Text(
        ' RM ${allTransactions[ind!].amount.toStringAsFixed(2)} ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      padding: EdgeInsets.all(10),
    );
  }

  Widget titleAndDate(int ind) {
    return Container(
      child: Column(
        children: [
          Text(
            allTransactions[ind].title!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Text(
            // DateFormat('dd-MM-yyyy').format(tx.date),
            DateFormat.yMMMMEEEEd().format(allTransactions[ind].date),
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                txAmount(ind: index),
                titleAndDate(index),
                Spacer(),
                IconButton(
                  onPressed: () => deleteTx(allTransactions[index].id),
                  color: Colors.red,
                  icon: Icon(Icons.delete,),
                )
              ],
            ),
          );
        },
        itemCount: allTransactions.length,
      ),
    );
  }
}
