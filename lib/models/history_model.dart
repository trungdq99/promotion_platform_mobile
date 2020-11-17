// Author: Trung Shin

class HistoryModel {
  int id;
  double amount;
  String date;
  int transactionType;
  String invoiceId;
  String notes;

  HistoryModel({
    this.id,
    this.amount: 0,
    this.date: '',
    this.transactionType: 0,
    this.invoiceId: '',
    this.notes: '',
  });

  HistoryModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.amount = map['amount'] ?? 0;
    this.date = map['date'] ?? '';
    this.transactionType = map['transactionType'] ?? 0;
    this.invoiceId = map['invoiceId'] ?? '';
    this.notes = map['notes'] ?? '';
  }
}
