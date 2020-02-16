import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/part2/content1/AllItemsPage.dart';
import 'package:flutter_news/part2/content1/DrawerPage.dart';
import 'package:flutter_news/part2/content1/SearchBar.dart';

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  TabController tabController;
  final List<Tab> tabs = [
    Tab(text: '关注'),
    Tab(text: '头条'),
    Tab(text: '视频'),
    Tab(text: '娱乐'),
    Tab(text: '体育'),
    Tab(text: '新时代'),
    Tab(text: '要闻'),
    Tab(text: '段子'),
    Tab(text: '知否'),
    Tab(text: '上海'),
    Tab(text: '公开课'),
    Tab(text: '圈子'),
    Tab(text: '财经'),
    Tab(text: '科技'),
    Tab(text: '汽车'),
    Tab(text: '网易号'),
    Tab(text: '军事'),
    Tab(text: '时尚'),
    Tab(text: '跟帖'),
    Tab(text: '直播'),
    Tab(text: '图片'),
    Tab(text: '小视频'),
    Tab(text: 'NBA'),
    Tab(text: '热点'),
    Tab(text: '房产'),
    Tab(text: '股票'),
    Tab(text: '轻松一刻'),
    Tab(text: '历史'),
    Tab(text: '家居'),
    Tab(text: '播单'),
    Tab(text: '独家'),
    Tab(text: '游戏'),
    Tab(text: '健康'),
    Tab(text: '航空'),
    Tab(text: '小说'),
    Tab(text: '热度'),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: 1,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: TabBarView(
        children: tabs.map((Tab tab) {
          return Center(
            child: Text('${tab.text}'),
          );
        }).toList(),
        controller: tabController,
      ),
//      body: Container(
//        child: Text("内容"),
////        child: Column(
////          mainAxisAlignment: MainAxisAlignment.start,
////          children: <Widget>[
////            RaisedButton(
////              onPressed: () {
////                Navigator.of(context).pushNamed('/recent');
////              },
////              child: Text("最近浏览"),
////            ),
////            RaisedButton(
////              onPressed: () {
////                Navigator.of(context).pushNamed('/level');
////              },
////              child: Text("等级列表"),
////            ),
////            RaisedButton(
////              onPressed: () {
////                Navigator.of(context).pushNamed('/account');
////              },
////              child: Text("账号设置"),
////            ),
////            RaisedButton(
////              onPressed: () {
////                Navigator.of(context).pushNamed('/video');
////              },
////              child: Text("小视频"),
////            ),
////            RaisedButton(
////              onPressed: () {
////                Navigator.of(context).pushNamed('/square');
////              },
////              child: Text("圈子"),
////            ),
////            RaisedButton(
////              onPressed: () {
////                Navigator.of(context).pushNamed('/freeflownews');
////              },
////              child: Text("免流量新闻"),
////            ),
////            RaisedButton(
////              onPressed: () {
////                Navigator.of(context).pushNamed('/allitems');
////              },
////              child: Text("全部栏目"),
////            ),
////          ],
////        ),
//      ),
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
//          Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return SearchBar(
//              Colors.white,
//              onCancelSearch: _onCancelSeardch,
//              onSearchChange: _onSearchChange,
//              onSearchSubmmit: _onSubmitData,
//            );
//          }));
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return SearchBar(
                    Colors.white,
                    onCancelSearch: _onCancelSeardch,
                    onSearchChange: _onSearchChange,
                    onSearchSubmmit: _onSubmitData,
                  );
                },
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return SlideTransition(
                    position: Tween(
                      begin: Offset(1.0, 0.0),
                      end: Offset(0, 0),
                    ).animate(animation),
                    child: child,
                  );
                },
                transitionDuration: Duration(milliseconds: 200)),
          );
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
//            Navigator.of(context).pushNamed("/allitems");
            jumpAllItemPage().then((index) {
              setState(() {
                tabController.index = index;
              });
            });
          },
        ),
      ],
      bottom: PreferredSize(
          child: Material(
            //tabs 背景色
            color: Colors.redAccent,
            child: TabBar(
              tabs: tabs,
              controller: tabController,
              isScrollable: true,
              //label
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.yellow,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 2),
              //线的高度
              indicatorWeight: 3,
              onTap: (index) {
                print("tab $index");
              },
            ),
          ),
          preferredSize: Size.fromHeight(50)),
    );
  }

  //搜索页面的取消搜索事件
  _onCancelSeardch() {
    Navigator.of(context).pop(); //  方法要放在state里面，才会有context上下文
  }

  _onSearchChange(String data) {
    print("搜索输入框输入字符串：$data");
  }

  _onSubmitData(String data) {
    print("提交输入字符串：$data");
  }

  Future<int> jumpAllItemPage() async {
    var index = await Navigator.of(context).pushNamed("/allitems");
    return index;
  }
}
