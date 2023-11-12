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
      transactionIcon: Icons.add,
      transactionCategory: "Top Up",
      transactionDate: "Oct 11",
      transactionOperator: "+",
      transactionAmount: 100000,
    ),
    TransactionModel(
      transactionIcon: Icons.splitscreen_outlined,
      transactionCategory: "Split",
      transactionDate: "Oct 9",
      transactionOperator: "-",
      transactionAmount: 700000,
    ),
    TransactionModel(
      transactionIcon: Icons.payments_outlined,
      transactionCategory: "Withdraw",
      transactionDate: "Sept 30",
      transactionOperator: "-",
      transactionAmount: 200000,
    ),
    TransactionModel(
      transactionIcon: Icons.call_received,
      transactionCategory: "Receive",
      transactionDate: "Aug 12",
      transactionOperator: "+",
      transactionAmount: 200000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            return RefreshIndicator(
              onRefresh: () {
                return Future.delayed(Duration(seconds: 3));
              },
              
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only( top: 16, bottom: 16, right: 16),
                            child: Container(
                             padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(shape: BoxShape.circle, color: data[index].transactionOperator == "+"
                              ? Color.fromARGB(255, 229, 247, 238)
                              : Color.fromARGB(255, 255, 224, 239)
                             ),
                             child: Icon(data[index].transactionIcon, color: data[index].transactionOperator == "+"
                              ? Color.fromARGB(255, 46, 163, 104)
                              : Color.fromARGB(255, 248, 0, 119), size: 30,),
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index].transactionCategory!,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                data[index].transactionDate!,
                                style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                          Spacer(),
                          Text(data[index].transactionOperator! + NumberFormat.currency(locale: "id")
                              .format(data[index].transactionAmount)
                              .toString(),
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
       ),
      ),
    );
  }
}