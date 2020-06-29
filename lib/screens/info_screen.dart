import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_app/model/date.dart';
import 'package:hackaton_app/constants.dart';
import 'package:hackaton_app/widgets/date_widget.dart';


class InfoScreen extends StatefulWidget {
  final Date data;
  final String aDay;
  InfoScreen(this.data, this.aDay);



  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  void initState() {
    super.initState();
   // update(widget.rawData);
  }

  void update(dynamic rawData) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.aDay);
    return Scaffold(
      floatingActionButton: OutlineButton.icon(
          onPressed: null,
          icon: Icon(Icons.navigate_next),
          label: Text('Next Fact')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/11.jpg'),
            fit: BoxFit.fill,
          ),
//          gradient: RadialGradient(
//            radius: 1.5,
//            stops: [
//              0.2,
//              3,
//            ],
//            colors: [
//              Color(0xFFe1f5fe),
//              Color(0xFF64ffda),
//            ],
//          ),
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
               DateShow(widget.aDay),
                /*Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.date,
                      style: kDateTextStyle,
                    ),
                  ],
                ),*/
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
                  'In year ${widget.data.data.events[0].year}, ${widget.data.data.events[0].text}',
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


