import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/TxModel.dart';

class TransactionList extends StatelessWidget {
  //const TransactionList({Key? key}) : super(key: key);
  final List<TxModel> allTransactions ;

  TransactionList({required this.allTransactions});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
            children: allTransactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
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
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            // DateFormat('dd-MM-yyyy').format(tx.date),
                            DateFormat.yMMMMEEEEd().format(tx.date),
                            style:
                            TextStyle(color: Colors.grey, fontSize: 15),
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
      ),
    );
  }
}
