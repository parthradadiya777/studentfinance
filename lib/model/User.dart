class User {
  String? uid;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? maritalStatus;
  String? profession;
  String? monthlyIncome;
  User({this.uid, this.phoneNumber, this.firstName, this.lastName, this.email, this.gender, this.maritalStatus, this.monthlyIncome, this.profession});

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    phoneNumber = json['phoneNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    maritalStatus = json['maritalStatus'];
    monthlyIncome = json['monthlyIncome'];
    profession = json['profession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['phoneNumber'] = phoneNumber;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['gender'] = gender;
    data['maritalStatus'] = maritalStatus;
    data['monthlyIncome'] = monthlyIncome;
    data['profession'] = profession;
    return data;
  }
}
