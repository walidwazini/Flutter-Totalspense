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

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

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
            Card(
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('Card'),
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => _titleController.clear(),
                        ),
                      ),
                      // controller: _titleController,
                      // onSubmitted: ,
                    ),
                    TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        suffixIcon: _amountController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () => _amountController.clear(),
                              )
                            : Container(
                                width: 0,
                                height: 0,
                              ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text('Add Transaction'),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
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
          ],
        ),
      ),
    );
  }
}
