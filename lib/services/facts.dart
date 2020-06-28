import 'networking.dart';

const url = 'http://history.muffinlabs.com/date';

class FactModel {
  static Future<dynamic> getFact(int month, int date) async {
    NetworkHelper networkHelper = NetworkHelper('$url/$month/$date');

    var factRawData = await networkHelper.getData();
    return (factRawData);
  }
}
