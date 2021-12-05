import 'package:flutter/material.dart';


import '../Models/TxModel.dart';
import '../Widgets/UserTx.dart';

class HomeScreen extends StatelessWidget {
  final List<TxModel> transactions = [];

  // final _titleController = TextEditingController();
  // final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
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
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
