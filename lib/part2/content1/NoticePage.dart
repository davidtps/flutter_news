import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  @override
  NoticePageState createState() => new NoticePageState();
}

class NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('圈子'),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
