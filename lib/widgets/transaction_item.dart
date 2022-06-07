import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final void Function(String p1) deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
          style: ButtonStyle(
              foregroundColor:
              MaterialStateProperty.all<Color>(
                  Theme.of(context).errorColor)),
          icon: Icon(Icons.delete),
          label: Text(
            'Delete',
          ),
          onPressed: () =>
              deleteTransaction(transaction.id),
        )
            : IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () =>
              deleteTransaction(transaction.id),
        ),
      ),
    );
  }
}
