import 'package:flutterapiarchitecture/model/getAllEmployee/Data.dart';

class AllEmployee {
  List<Data> data;
  String status;

  AllEmployee({this.data, this.status});

  factory AllEmployee.fromJson(Map<String, dynamic> json) {
    return AllEmployee(
      data: json['data'] != null
          ? (json['data'] as List).map((i) => Data.fromJson(i)).toList()
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
