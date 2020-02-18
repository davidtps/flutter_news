import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/part1/SmallVideoPage.dart';
import 'package:flutter_news/part2/content1/AllItemsPage.dart';
import 'package:flutter_news/part2/content1/DrawerPage.dart';
import 'package:flutter_news/part2/content1/HomePage.dart';
import 'package:flutter_news/part2/content1/HotPage.dart';
import 'package:flutter_news/part2/content1/NoticePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //设置系统状态栏颜色
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
        "/hot": (context) => HotPage(),
        "/notice": (context) => NoticePage(),
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
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body: TabBarView(
////        children: tabs.map((Tab tab) {
////          return Center(
////            child: Text('${tab.text}'),
////          );
////        }).toList(),
//        children: tabContents,
//        controller: tabController,
//      ),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          //切换底部页签
          setState(() {
            print("页签切换：$index");
            _currentIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(),
        //禁止滑动切换页面
        children: <Widget>[
          HomePage(),
          SmallVideoPage(),
          HotPage(),
          NoticePage(),
        ],
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
        //选中的颜色
        fixedColor: Colors.red,
        onTap: (index) {
          print("底部页签点击了第$index");
          changeIndex(index);
        },
      ),
      drawer: DrawerPage(),
      drawerEdgeDragWidth: 20,
      drawerDragStartBehavior: DragStartBehavior.start,
    );
  }

  void changeIndex(int index) {
    if (index != _currentIndex) {
      pageController.jumpToPage(index);
      setState(() {
        _currentIndex = index;
      });
    }
  }
}
