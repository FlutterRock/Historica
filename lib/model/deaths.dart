import 'links.dart';

class Deaths {
  String year;
  String text;
  String html;
  String noYearHtml;
  List<Links> links;

  Deaths({this.year, this.text, this.html, this.noYearHtml, this.links});

  Deaths.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    text = json['text'];
    html = json['html'];
    noYearHtml = json['no_year_html'];
    if (json['links'] != null) {
      links = new List<Links>();
      json['links'].forEach((v) {
        links.add(new Links.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['text'] = this.text;
    data['html'] = this.html;
    data['no_year_html'] = this.noYearHtml;
    if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
