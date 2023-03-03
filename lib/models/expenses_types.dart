class ExpensesType {
  String? createdAt;
  String? updatedAt;
  String? expenseTypeName;
  int? id;

  ExpensesType({this.createdAt, this.updatedAt, this.expenseTypeName, this.id});

  ExpensesType.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    expenseTypeName = json['expenseTypeName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['expenseTypeName'] = expenseTypeName;
    data['id'] = id;
    return data;
  }
}
