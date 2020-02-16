import 'package:flutter/material.dart';

class HotPage extends StatefulWidget {
  @override
  HotPageState createState() => new HotPageState();
}

class HotPageState extends State<HotPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('热门'),
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
