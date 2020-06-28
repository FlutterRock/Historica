import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackaton_app/services/facts.dart';
import 'info_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var rawFacts =
        await FactModel.getFact(DateTime.now().month, DateTime.now().day);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return InfoScreen(rawFacts);
        },
      ),
    );
  }



  void getData2(int month, int day) async {
    var rawFacts = await FactModel.getFact(month, day);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return InfoScreen(rawFacts);
    }));
  }

  var _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.8,
            stops: [
              0.2,
              1,
            ],
            colors: [
              Color(0xFFFFFFFA),
              Color(0xFFEFE2CB),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                  getData(date.month, date.day);
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'TEST',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitWanderingCubes(
              color: Colors.red,
            ),
          ],
        ),
        constraints: BoxConstraints.expand(),
      ),
    );
  }
}
