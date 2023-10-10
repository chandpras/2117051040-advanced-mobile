class TransactionModel {
  String? transactionCategory;
  String? date;
  double? amount;

  TransactionModel({
    this.transactionCategory,
    this.date,
    this.amount,
  });

  List<TransactionModel> getDummyData() {
    return [
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
  }
}