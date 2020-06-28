import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_app/services/month.dart';
import 'package:hackaton_app/constants.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen(this.rawData);

  final rawData;

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  int x;

  @override
  void initState() {
    super.initState();
    update(widget.rawData);

    controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );

    controller.forward();

    controller.addListener(() {
      setState(() {
        x = controller.value.toInt() * 5;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void update(dynamic rawData) {
    setState(() {});
  }

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
              Color(0xFF795548),
            ],
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              18.0,
              30.0,
              18.0,
              18.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateTime.now().day.toString(),
                      style: kDateTextStyle,
                    ),
                    Text(
                      Month().getMonthName(DateTime.now().month),
                      style: kDateTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                  width: double.infinity,
                  child: Divider(
                    color: Colors.red,
                  ),
                ),
                Text(
                  'Today in',
                  style: kHeaderTextStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'History',
                  style: kHeaderTextStyle,
                ),
                SizedBox(
                  height: 40.0,
                  width: double.infinity,
                  child: Divider(
                    indent: 20.0,
                    endIndent: 400.0,
                  ),
                ),
                Text(
                  'In year ${widget.rawData['data']['Events'][x]['year']}, ${widget.rawData['data']['Events'][0]['text']}',
                  style: kDateTextStyle1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
