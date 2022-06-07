import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  void Function(String) deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset('assets/images/waiting.png',
                            fit: BoxFit.cover)),
                  ],
                );
              })
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return TransactionItem(transaction: transactions[index], deleteTransaction: deleteTransaction);
                },
                itemCount: transactions.length,
              ));
  }
}
