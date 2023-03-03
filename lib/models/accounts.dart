import 'package:expenses_tracker/models/expenses.dart';

class Accounts {
  String? createdAt;
  String? updatedAt;
  String? name;
  int? balance;
  List<Expenses>? expenses;
  int? id;

  Accounts(
      {this.createdAt,
      this.updatedAt,
      this.name,
      this.balance,
      this.expenses,
      this.id});

  Accounts.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    balance = json['balance'];
    if (json['expenses'] != null) {
      expenses = <Expenses>[];
      json['expenses'].forEach((v) {
        expenses!.add(Expenses.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['name'] = name;
    data['balance'] = balance;
    if (expenses != null) {
      data['expenses'] = expenses!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    return data;
  }
}
