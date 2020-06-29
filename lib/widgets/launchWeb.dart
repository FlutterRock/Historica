import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
class Helper{


  static launchURL(String url) async {
      if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }


  static Future<DateTime> setTime(DateTime time) async {

    int timestamp = time.millisecondsSinceEpoch;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('myTimestampKey', timestamp);

  }

   static Future<DateTime> getTime() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int timestamp = prefs.getInt('myTimestampKey');

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return dateTime;
  }


}