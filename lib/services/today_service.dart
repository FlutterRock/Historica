import 'dart:convert';

import 'package:hackaton_app/model/date.dart';
import 'package:http/http.dart';


const url = 'http://history.muffinlabs.com/date';

abstract class TodayService{
  //Future getDate();
  Future<Date> getDate();
}

class TodayServiceImplementation implements TodayService {

  @override
  Future<Date> getDate() async{
    Response res = await get(url);

    if (res.statusCode == 200) {
      String data = res.body;
    var dataValue =  jsonDecode(data);

    print("Data from api $dataValue");

      Map<String, dynamic> user = jsonDecode(data);
      var name = user['date'];

    return Date(
      date: name
    );
    } else {
      print(res.statusCode);
    }
    throw UnimplementedError();
  }

}
