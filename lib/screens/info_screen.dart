import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_app/managers/today_manager.dart';
import 'package:hackaton_app/model/date.dart';
import 'package:hackaton_app/constants.dart';
import 'package:hackaton_app/widgets/date_widget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:hackaton_app/widgets/launchWeb.dart';

import '../service_locator.dart';

class InfoScreen extends StatefulWidget {
  final Date data;
  final String aDay;
  InfoScreen(this.data, this.aDay);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int index;
  DateTime _selectedValue = DateTime.now();
  bool _isVisible = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    index = 0;
  }
  @override
  Widget build(BuildContext context) {
    int limit = widget.data.data.events.length;

    return Scaffold(
      floatingActionButton: OutlineButton.icon(
          onPressed: () {
            setState(() {
              if (index == limit - 1) {
              } else {
                index++;
              }
            });
          },
          icon: Icon(Icons.navigate_next),
          label: Text('Next Fact')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/11.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
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
                  GestureDetector(
                    onTap: () {
                      showToast();
                    },
                    child: DateShow(
                      widget.aDay,
                    ),
                  ),
                  Visibility(
                    visible: _isVisible,
                    child: DatePicker(
                      _selectedValue,
                      height: 90,
                      initialSelectedDate: _selectedValue,
                      selectionColor: Colors.black,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) {
                        // New date selected
                        sl<TodayManager>().inRequest.add(date);
                        setState(() {
                          //_selectedValue =  Helper.getTime();
                          _isVisible = false;
                          // getData(date.month, date.day);
                        });
                      },
                    ),
                  ),

                    SizedBox(
                      height: 20.0,
                      width: double.infinity,
                      child: Divider(
                        color: Colors.red,
                      ),
                    ),
                  TyperAnimatedTextKit(
                    speed: Duration(milliseconds: 800),
                    onTap: () {
                      setState(() {});
                    },
                    text: [
                      'Today in',
                    ],
                    textStyle: kHeaderTextStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TyperAnimatedTextKit(
                    speed: Duration(milliseconds: 800),
                    onTap: () {
                      setState(() {});
                    },
                    text: [
                      'History',
                    ],
                    textStyle: kHeaderTextStyle,
                  ),
                  SizedBox(
                    height: 30.0,
                    width: double.infinity,
                    child: Divider(
                      indent: 20.0,
                      endIndent: 400.0,
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () {
                      Helper.launchURL(
                          "${widget.data.data.events[index].links[0].link}");
                    },
                    child: SingleChildScrollView(
                      child: Text(
                        'In year ${widget.data.data.events[index].year}, ${widget.data.data.events[index].text}',
                        style: kDateTextStyle1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
