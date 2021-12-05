import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/TxModel.dart';
import '../Widgets/TxList.dart';

class HomeScreen extends StatelessWidget {
  final List<TransactionModel> transactions = [];

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
            TransactionList(),
          ],
        ),
      ),
    );
  }
}
