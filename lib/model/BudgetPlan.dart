class BudgetPlan {
  late String name;
  late int expenses;
  late int savings;
  late int investments;
  late double rating;

  BudgetPlan({required this.name, required this.expenses, required this.savings, required this.investments, required this.rating});

  BudgetPlan.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    expenses = json['expenses'];
    savings = json['savings'];
    investments = json['investments'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['name'] = name;
    data['expenses'] = expenses;
    data['savings'] = savings;
    data['investments'] = investments;
    data['rating'] = rating;

    return data;
  }
}