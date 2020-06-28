import 'package:flutter/material.dart';
import 'package:historyspeaks/services/fact.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getFacts();
  }

  void getFacts() async {
    var factData =
        await FactModel().getFact(DateTime.now().day, DateTime.now().month);
    print(factData);

//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) {
//        return LocationScreen(
//          locationWeather: weatherData,
//        );
//      }),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
