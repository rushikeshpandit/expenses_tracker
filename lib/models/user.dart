import 'package:expenses_tracker/models/Accounts.dart';
import 'package:expenses_tracker/models/expenses_types.dart';
import 'package:expenses_tracker/models/roles.dart';

class User {
  String? createdAt;
  String? updatedAt;
  String? username;
  String? email;
  List<Accounts>? accounts;
  List<ExpensesType>? expensesType;
  List<Roles>? roles;
  int? id;
  bool? enabled;
  String? userName;
  bool? accountNonExpired;
  bool? accountNonLocked;
  bool? credentialsNonExpired;

  User(
      {this.createdAt,
      this.updatedAt,
      this.username,
      this.email,
      this.accounts,
      this.expensesType,
      this.roles,
      this.authorities,
      this.id,
      this.enabled,
      this.userName,
      this.accountNonExpired,
      this.accountNonLocked,
      this.credentialsNonExpired});

  User.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    username = json['username'];
    email = json['email'];
    if (json['accounts'] != null) {
      accounts = <Accounts>[];
      json['accounts'].forEach((v) {
        accounts!.add(Accounts.fromJson(v));
      });
    }
    if (json['expensesType'] != null) {
      expensesType = <ExpensesType>[];
      json['expensesType'].forEach((v) {
        expensesType!.add(ExpensesType.fromJson(v));
      });
    }
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    id = json['id'];
    enabled = json['enabled'];
    userName = json['userName'];
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['username'] = username;
    data['email'] = email;
    if (accounts != null) {
      data['accounts'] = accounts!.map((v) => v.toJson()).toList();
    }
    if (expensesType != null) {
      data['expensesType'] = expensesType!.map((v) => v.toJson()).toList();
    }
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['enabled'] = enabled;
    data['userName'] = userName;
    data['accountNonExpired'] = accountNonExpired;
    data['accountNonLocked'] = accountNonLocked;
    data['credentialsNonExpired'] = credentialsNonExpired;
    return data;
  }
}
