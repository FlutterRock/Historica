import 'networking.dart';

const url = 'http://history.muffinlabs.com/date';

class FactModel {
  Future<dynamic> getFact(int date, int month) async {
    NetworkHelper networkHelper = NetworkHelper('$url/$month/$date');

    var factRawData = await networkHelper.getData();

    return factRawData;
  }
}
