import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/part1/AccountSettingsPage.dart';
import 'package:flutter_news/part1/FreeFlowNewsPage.dart';
import 'package:flutter_news/part1/LevelPage.dart';
import 'package:flutter_news/part1/RecentPage.dart';
import 'package:flutter_news/part1/SmallVideoPage.dart';
import 'package:flutter_news/part1/SquarePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/recent': (context) => RecentPage(),
        '/level': (context) => LevelPage(),
        '/account': (context) => AccountSettingsPage(),
        '/video': (context) => SmallVideoPage(),
        '/square': (context) => SquarePage(),
        '/freeflownews': (context) => FreeFlowNewsPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/recent');
              },
              child: Text("最近浏览"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/level');
              },
              child: Text("等级列表"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/account');
              },
              child: Text("账号设置"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/video');
              },
              child: Text("小视频"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/square');
              },
              child: Text("圈子"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/freeflownews');
              },
              child: Text("免流量新闻"),
            ),
          ],
        ),
      ),
    );
  }
}
