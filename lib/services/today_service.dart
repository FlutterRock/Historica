import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hackaton_app/model/data.dart';
import 'package:hackaton_app/model/date.dart';
import 'package:hackaton_app/model/events.dart';
import 'package:http/http.dart';

const url = 'http://history.muffinlabs.com/date';

abstract class TodayService {
  //Future getDate();
  Future<Date> getDate(int month, int day);
}

class TodayServiceImplementation implements TodayService {
  @override
  Future<Date> getDate(month, day) async {
    Response res = await get('$url/$month/$day');

    if (res.statusCode == 200) {
      String data = res.body;
      Map<String, dynamic> date = jsonDecode(data);

      return  Date.fromJson(date);

    } else {
      print(res.statusCode);
    }
    throw UnimplementedError();

  }
}
