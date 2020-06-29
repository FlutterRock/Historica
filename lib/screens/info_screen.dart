import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_app/model/date.dart';
import 'package:hackaton_app/constants.dart';
import 'package:hackaton_app/widgets/date_widget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class InfoScreen extends StatefulWidget {
  final Date data;
  final String aDay;
  InfoScreen(this.data, this.aDay);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int index;

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
                      print('hello');
                    },
                    child: DateShow(
                      widget.aDay,
                    ),
                  DateShow(
                    widget.aDay,
                  ),
                    DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.black,
                      height: 70,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          // _selectedValue = date;
                          // getData(date.month, date.day);
                        });
                      },
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
                  GestureDetector(
                    onLongPress: () {
                      print('open browser');
                    },
                    child: Text(
                      'In year ${widget.data.data.events[index].year}, ${widget.data.data.events[index].text}',
                      style: kDateTextStyle1,
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
