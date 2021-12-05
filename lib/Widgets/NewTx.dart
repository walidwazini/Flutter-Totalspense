import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxHandler;

  NewTransaction({required this.addTxHandler});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void submitData(){
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return ;
    }
    widget.addTxHandler(
     enteredTitle, enteredAmount
    );
    Navigator.of(context).pop();
  }

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
             onSubmitted: (_) => (submitData),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              onSubmitted: (_) => (submitData),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
