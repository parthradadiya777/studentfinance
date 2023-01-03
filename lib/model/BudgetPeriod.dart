import 'PeriodType.dart';

class BudgetPeriod {
  late PeriodType periodType;
  late DateTime startDate;
  late DateTime endDate;
  late bool repeat;

  BudgetPeriod(
      {required this.periodType,
      required this.startDate,
      required this.endDate,
      required this.repeat});

  BudgetPeriod.fromJson(Map<String, dynamic> json) {
    periodType = json['periodType'];
    startDate = DateTime.parse(json['startDate']);
    endDate = DateTime.parse(json['endDate']);
    repeat = json['repeat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['periodType'] = periodType;
    data['startDate'] = startDate.toUtc();
    data['endDate'] = endDate.toUtc();
    data['repeat'] = repeat;

    return data;
  }
}
