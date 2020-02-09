import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '首页'),
//      routes: {
//        '/recent': (context) => RecentPage(),
//        '/level': (context) => LevelPage(),
//        '/account': (context) => AccountSettingsPage(),
//        '/video': (context) => SmallVideoPage(),
//        '/square': (context) => SquarePage(),
//        '/freeflownews': (context) => FreeFlowNewsPage(),
//        '/allitems': (context) => AllItemsPage(),
//      },
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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Text("内容"),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            RaisedButton(
//              onPressed: () {
//                Navigator.of(context).pushNamed('/recent');
//              },
//              child: Text("最近浏览"),
//            ),
//            RaisedButton(
//              onPressed: () {
//                Navigator.of(context).pushNamed('/level');
//              },
//              child: Text("等级列表"),
//            ),
//            RaisedButton(
//              onPressed: () {
//                Navigator.of(context).pushNamed('/account');
//              },
//              child: Text("账号设置"),
//            ),
//            RaisedButton(
//              onPressed: () {
//                Navigator.of(context).pushNamed('/video');
//              },
//              child: Text("小视频"),
//            ),
//            RaisedButton(
//              onPressed: () {
//                Navigator.of(context).pushNamed('/square');
//              },
//              child: Text("圈子"),
//            ),
//            RaisedButton(
//              onPressed: () {
//                Navigator.of(context).pushNamed('/freeflownews');
//              },
//              child: Text("免流量新闻"),
//            ),
//            RaisedButton(
//              onPressed: () {
//                Navigator.of(context).pushNamed('/allitems');
//              },
//              child: Text("全部栏目"),
//            ),
//          ],
//        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: Text("首页"),
            icon: Icon(
              Icons.home,
              size: 24,
            ),
//            backgroundColor: Colors.white,
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("视频"),
            icon: Icon(
              Icons.videocam,
              size: 24,
            ),
//            backgroundColor: Colors.grey,
            activeIcon: Icon(Icons.videocam),
          ),
          BottomNavigationBarItem(
            title: Text("圈子"),
            icon: Icon(
              Icons.my_location,
              size: 24,
            ),
//            backgroundColor: Colors.white,
            activeIcon: Icon(Icons.my_location),
          ),
          BottomNavigationBarItem(
            title: Text(
              "我的",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            icon: Icon(
              Icons.face,
              size: 24,
            ),
//            backgroundColor: Colors.white,
            activeIcon: Icon(Icons.face),
          ),
        ],

        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        fixedColor: Colors.red,
        //选中的颜色
        onTap: (index) {
          print("点击了第$index");
          changeIndex(index);
        },
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
