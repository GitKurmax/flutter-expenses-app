import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  DateTime? chosenData;

  void _submitData() {
    final enteredTitle = titleInputController.text;
    final enteredAmount = double.parse(amountInputController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    widget.addNewTransaction(enteredTitle, enteredAmount, chosenData);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((val) => {
              setState(() {
                chosenData = val;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleInputController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountInputController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      chosenData != null
                          ? 'Picked date: ${DateFormat.yMMMd().forma t(chosenData!)}'
                          : 'No date chosen!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(primary: Colors.purple),
                      onPressed: _presentDatePicker,
                      child: Text('Choose Date')),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: _submitData, child: Text('Add transaction')),
          ],
        ),
      ),
    );
  }
}
