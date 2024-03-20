import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key, this.transactions});

  final List<Transactions>? transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: transactions!.length,
        itemBuilder: (context, index) {
          final tr = transactions?[index];

           return Card(
            child: Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  )),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'R\$ ${tr!.value.toStringAsFixed(2)}', // VALOR
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr.title, // titulo
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('d MMM y')
                          .format(tr.date)
                          .toUpperCase(), // data
                      style: const TextStyle(color: Colors.blueGrey),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
