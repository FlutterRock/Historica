import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackaton_app/managers/today_manager.dart';
import 'package:hackaton_app/model/date.dart';
import 'package:hackaton_app/services/facts.dart';
import 'info_screen.dart';
import 'service_locator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
   //getData();
  }

  void getData() async {
    var rawFacts = await FactModel.getFact(6, 27);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return InfoScreen(rawFacts);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: sl<TodayManager>().today$,
          builder: (BuildContext context, AsyncSnapshot<Date> snapshot) {
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none: return Text('Select lot');
              case ConnectionState.waiting: return CircularProgressIndicator();
              case ConnectionState.active: return Text(snapshot.data.date);
              case ConnectionState.done: return Text('${snapshot.data} (closed)');
            }
            return null;
          },),
      ),
    );
  }


  Widget _body(){
    return Container(
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
    );
  }
}
