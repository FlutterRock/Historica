import 'births.dart';
import 'deaths.dart';
import 'events.dart';

class Data {
  List<Events> events;
  List<Births> births;
  List<Deaths> deaths;

  Data({this.events, this.births, this.deaths});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Events'] != null) {
      events = new List<Events>();
      json['Events'].forEach((v) {
        events.add(new Events.fromJson(v));
      });
    }
    if (json['Births'] != null) {
      births = new List<Births>();
      json['Births'].forEach((v) {
        births.add(new Births.fromJson(v));
      });
    }
    if (json['Deaths'] != null) {
      deaths = new List<Deaths>();
      json['Deaths'].forEach((v) {
        deaths.add(new Deaths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['Events'] = this.events.map((v) => v.toJson()).toList();
    }
    if (this.births != null) {
      data['Births'] = this.births.map((v) => v.toJson()).toList();
    }
    if (this.deaths != null) {
      data['Deaths'] = this.deaths.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
