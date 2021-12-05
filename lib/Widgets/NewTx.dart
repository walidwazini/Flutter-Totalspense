import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTxHandler;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  NewTransaction(this.addTxHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
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
              ),
              // controller: _titleController,
              // onSubmitted: ,
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addTxHandler(
                  _titleController.text,
                    double.parse(_amountController.text),
                );
              }, child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
