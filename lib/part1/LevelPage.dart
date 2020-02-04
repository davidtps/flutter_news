import 'package:flutter/material.dart';

class LevelPage extends StatefulWidget {
  @override
  LevelPageState createState() => new LevelPageState();
}

class LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('等级列表'),
      ),
      body: new Column(children: <Widget>[
        buildRowTitle(context),
        buildRowContents(context, "科员", Icons.star_border, "0", "0"),
        buildRowContents(context, "科员", Icons.star_half, "0", "10"),
        buildRowContents(context, "科员", Icons.brightness_1, "0", "100"),
        buildRowContents(context, "科员", Icons.brightness_2, "0", "200"),
        buildRowContents(context, "科员", Icons.brightness_4, "0", "400"),
        buildRowContents(context, "科员", Icons.brightness_3, "0", "600"),
      ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget buildRowTitle(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 4 - 20;
    return new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
              alignment: Alignment.center,
              width: width,
              padding: EdgeInsets.all(5),
              child: Text("等级头衔"),
              margin: EdgeInsets.all(5)),
          new Container(
              alignment: Alignment.center,
              width: width,
              padding: EdgeInsets.all(5),
              child: Text("等级图标"),
              margin: EdgeInsets.all(5)),
          new Container(
              alignment: Alignment.center,
              width: width,
              padding: EdgeInsets.all(5),
              child: Text("等级"),
              margin: EdgeInsets.all(5)),
          new Container(
              alignment: Alignment.center,
              width: width,
              padding: EdgeInsets.all(5),
              child: Text("所需积分"),
              margin: EdgeInsets.all(5)),
        ]);
  }

  Widget buildRowContents(BuildContext context, String name, IconData icon,
      String level, String score) {
    double width = MediaQuery.of(context).size.width / 4 - 20;
    return new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
              width: width,
              child: Text(name),
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: new Border.all(width: 1.0, color: Colors.orange))),
          new Container(
              alignment: Alignment.center,
              width: width,
              padding: EdgeInsets.all(5),
              child: Icon(
                icon,
                size: 10,
              ),
              margin: EdgeInsets.all(5)),
          new Container(
              alignment: Alignment.center,
              width: width,
              padding: EdgeInsets.all(5),
              child: Text(level),
              margin: EdgeInsets.all(5)),
          new Container(
              alignment: Alignment.center,
              width: width,
              padding: EdgeInsets.all(5),
              child: Text(score),
              margin: EdgeInsets.all(5)),
        ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(LevelPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
