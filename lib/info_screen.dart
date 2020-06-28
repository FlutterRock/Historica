import 'package:flutter/material.dart';

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
    return Scaffold();
  }
}
