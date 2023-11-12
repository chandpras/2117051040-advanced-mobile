import 'package:flutter/material.dart';

class TransactionModel {
  IconData? transactionIcon;
  String? transactionCategory;
  String? transactionDate;
  String? transactionOperator;
  double? transactionAmount;

  TransactionModel({
    this.transactionIcon,
    this.transactionCategory,
    this.transactionDate,
    this.transactionOperator,
    this.transactionAmount,
  });
}