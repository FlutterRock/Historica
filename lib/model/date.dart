import 'data.dart';

class Date {
  String date;
  String year;
  String desc;
  String url;
  Data data;

  Date({this.date, this.url, this.data});

  Date.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    url = json['url'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['url'] = this.url;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
