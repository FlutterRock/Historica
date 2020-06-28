import 'package:flutter/material.dart';
import 'package:hackaton_app/services/month.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen(this.rawData);

  final rawData;

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  void initState() {
    super.initState();
    update(widget.rawData);
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
              Color(0xFFEFE2CB),
            ],
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateTime.now().day.toString(),
                  style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  Month().getMonthName(DateTime.now().month),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: double.infinity,
                  child: Divider(
                    color: Colors.red,
                  ),
                ),
                Text(
                  'Today in',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  'History',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                  width: double.infinity,
                  child: Divider(
                    indent: 20.0,
                    endIndent: 200.0,
                    thickness: 20.0,
                    color: Color(0xFFEFE2CB),
                  ),
                ),
                Text(
                  'In year ${widget.rawData['data']['Events'][0]['year']}, ${widget.rawData['data']['Events'][0]['text']}',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
