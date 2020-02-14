import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/part1/AllItemsPage.dart';
import 'package:flutter_news/part2/SearchBar.dart';
import 'package:flutter_news/part2/content1/DrawerPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //设置系统状态栏颜色
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.blue));
    return MaterialApp(
      //隐藏调试banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: '首页'),
      routes: {
//        '/recent': (context) => RecentPage(),
//        '/level': (context) => LevelPage(),
//        '/account': (context) => AccountSettingsPage(),
//        '/video': (context) => SmallVideoPage(),
//        '/square': (context) => SquarePage(),
//        '/freeflownews': (context) => FreeFlowNewsPage(),
        '/allitems': (context) => AllItemsPage(),
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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
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
            title: Text("我的"),
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
      drawer: DrawerPage(),
      drawerEdgeDragWidth: 100,
      drawerDragStartBehavior: DragStartBehavior.start,
    );
  }

  void changeIndex(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
//    leading: Icon(Icons.add),
      titleSpacing: 5,
      title: GestureDetector(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Colors.red[200],
              border: Border.all(
                color: Colors.redAccent,
                width: 1,
                style: BorderStyle.solid,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.search,
                size: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "点击进行搜索啊！",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SearchBar(
              Colors.white,
              onCancelSearch: _onCancelSeardch,
            );
          }));
//          Navigator
//              .of(context)
//              .push(
//              PageRouteBuilder(pageBuilder: (BuildContext context,
//                  Animation<double> animation,
//                  Animation<double> secondaryAnimation) {
//                return SearchBar();
//              },)
        },
      ),
      actions: <Widget>[
        InkWell(
          child: Icon(
            Icons.whatshot,
            size: 24,
          ),
          onTap: () {
            print("热门");
          },
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              Icons.chat,
              size: 24,
            ),
          ),
          onTap: () {
            print("圈子");
          },
        ),
        InkWell(
          child: Icon(
            Icons.format_list_bulleted,
            size: 24,
          ),
          onTap: () {
            print("所有栏目");
            Navigator.of(context).pushNamed("/allitems");
          },
        ),
      ],
    );
  }

  //搜索页面的取消搜索事件
  _onCancelSeardch() {
    Navigator.of(context).pop(); //  方法要放在state里面，才会有context上下文
  }
}
