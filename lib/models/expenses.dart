import 'package:expenses_tracker/models/transaction_type.dart';

class Expenses {
  String? createdAt;
  String? updatedAt;
  String? description;
  int? amount;
  TransactionType? transactionType;
  int? id;

  Expenses(
      {this.createdAt,
      this.updatedAt,
      this.description,
      this.amount,
      this.transactionType,
      this.id});

  Expenses.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    description = json['description'];
    amount = json['amount'];
    transactionType = json['transactionType'] != null
        ? TransactionType.fromJson(json['transactionType'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['description'] = description;
    data['amount'] = amount;
    if (transactionType != null) {
      data['transactionType'] = transactionType!.toJson();
    }
    data['id'] = id;
    return data;
  }
}
