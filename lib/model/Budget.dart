import 'BudgetPeriod.dart';
import 'BudgetPlan.dart';

class Budget {
  late String name;
  late BudgetPlan budgetPlan;
  late double amount;
  late BudgetPeriod budgetPeriod;
  late bool autoDetectActivity;
  late String userId;

  Budget(
      {required this.name,
      required this.budgetPlan,
      required this.amount,
      required this.budgetPeriod,
      required this.autoDetectActivity,
      required this.userId});

  Budget.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    budgetPeriod = BudgetPeriod.fromJson(json['budgetPeriod']);
    budgetPlan = BudgetPlan.fromJson(json['budgetPlan']);
    amount = json['amount'];
    autoDetectActivity = json['autoDetectActivity'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'budgetPeriod': budgetPeriod.toJson(),
        'budgetPlan': budgetPlan.toJson(),
        'amount': amount,
        'autoDetectActivity': autoDetectActivity,
        'userId': userId
      };
}
