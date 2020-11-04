class Data {
  String employee_age;
  String employee_name;
  String employee_salary;
  String id;
  String profile_image;

  Data(
      {this.employee_age,
      this.employee_name,
      this.employee_salary,
      this.id,
      this.profile_image});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      employee_age: json['employee_age'],
      employee_name: json['employee_name'],
      employee_salary: json['employee_salary'],
      id: json['id'],
      profile_image: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_age'] = this.employee_age;
    data['employee_name'] = this.employee_name;
    data['employee_salary'] = this.employee_salary;
    data['id'] = this.id;
    data['profile_image'] = this.profile_image;
    return data;
  }
}
