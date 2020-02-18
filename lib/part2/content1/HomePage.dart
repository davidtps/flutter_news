import 'package:flutter/material.dart';
import 'package:flutter_news/part2/content1/SearchBar.dart';
import 'package:flutter_news/part2/content1/TabContentPage.dart';
import 'package:flutter_news/routes/RouteManager.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
//        children: tabs.map((Tab tab) {
//          return Center(
//            child: Text('${tab.text}'),
//          );
//        }).toList(),
          children: tabContents,
          controller: tabController,
        ));
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

          RouteManager.jumpPageWithAnim(
            context,
            SearchBar(
              Colors.white,
              onCancelSearch: _onCancelSeardch,
              onSearchChange: _onSearchChange,
              onSearchSubmmit: _onSubmitData,
            ),
            type: Type.RIGHT_TO_LEFT,
            duration: 200,
          );
//          Navigator.of(context).push(
//            PageRouteBuilder(
//                pageBuilder: (BuildContext context, Animation<double> animation,
//                    Animation<double> secondaryAnimation) {
//                  return SearchBar(
//                    Colors.white,
//                    onCancelSearch: _onCancelSeardch,
//                    onSearchChange: _onSearchChange,
//                    onSearchSubmmit: _onSubmitData,
//                  );
//                },
//                transitionsBuilder: (BuildContext context,
//                    Animation<double> animation,
//                    Animation<double> secondaryAnimation,
//                    Widget child) {
//                  return SlideTransition(
//                    position: Tween(
//                      begin: Offset(1.0, 0.0),
//                      end: Offset(0, 0),
//                    ).animate(animation),
//                    child: child,
//                  );
//                },
//                transitionDuration: Duration(milliseconds: 300)),
//          );
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
//            Navigator.of(context).pushNamed("/hot");
            RouteManager.jumpPageWithName(context, "/hot");
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
            print("通知");
//            Navigator.of(context).pushNamed("/notice");
            RouteManager.jumpPageWithName(context, "/notice");
//            RouteManager.jumpPageWithAnim(context, new NoticePage());
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
}
