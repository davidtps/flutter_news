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
          children: homeTabContents,
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
              tabs: homeTabs,
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
          preferredSize: Size.fromHeight(40)),
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
    print("home initState()");
    tabController = TabController(
      length: homeTabs.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("home dispose");
    tabController.dispose();
  }
}
