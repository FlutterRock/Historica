import 'package:hackaton_app/model/date.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    Response res = await get(url);

    if (res.statusCode == 200) {
      String data = res.body;
      return Date.fromJson(jsonDecode(data));
      //  return jsonDecode(data);
    } else {
      print(res.statusCode);
    }
  }
}
