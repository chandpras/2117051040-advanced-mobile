import 'package:flutter/material.dart';
import 'package:justduit/models/transaction_model.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  List<TransactionModel> data = [
    TransactionModel(
      transactionCategory: "QR",
      date: "2021-10-10",
      amount: 10000,
    ),
    TransactionModel(
      transactionCategory: "Top Up",
      date: "2021-10-10",
      amount: 70000,
    ),
    TransactionModel(
      transactionCategory: "Mobile",
      date: "2021-10-10",
      amount: 2000000,
    ),
    TransactionModel(
      transactionCategory: "Sent",
      date: "2021-10-10",
      amount: 100000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction"),
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RefreshIndicator(
              onRefresh: () {
                return Future.delayed(Duration(seconds: 3));
              },
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].transactionCategory!),
                              Text(data[index].date!)
                            ],
                          ),
                          Spacer(),
                          Text(NumberFormat.currency(locale: "id")
                              .format(data[index].amount)
                              .toString()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}