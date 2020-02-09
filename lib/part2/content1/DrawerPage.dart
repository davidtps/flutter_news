import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  DrawerPageState createState() => new DrawerPageState();
}

class DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      child: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('侧边栏'),
//        ),
      ),
      width: width * 4 / 5,
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
