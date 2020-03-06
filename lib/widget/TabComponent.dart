import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/part2/content1/SearchBar.dart';
import 'package:flutter_news/routes/RouteManager.dart';

class TabComponent extends StatefulWidget {
  List<Tab> tabs;
  List<String> tabLabels;
  List<Widget> tabContents;

  VoidCallback onCancelSearch;
  SearchChangeCallback onSearchChange;
  bool isShowSearch;
  bool isScrollable;
  int result = 0;

  Color backgroundColor;
  Brightness brightness;

  TabComponent(this.tabLabels,
      this.tabContents, {
        Key key,
        this.onSearchChange,
        this.onCancelSearch,
        this.isShowSearch = false,
        this.isScrollable = true,
        this.backgroundColor = Colors.red,
        this.brightness = Brightness.dark,
      }) : super(key: key);

  @override
  TabComponentState createState() => new TabComponentState();
}

class TabComponentState extends State<TabComponent>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('视频'),
        toolbarOpacity: 0,
        //可以完全隐藏title,只让bottom widget显示；可以直接让title为对应的widget
        backgroundColor: widget.backgroundColor,
        brightness: widget.brightness,
        bottom: PreferredSize(
          child: Row(
            children: <Widget>[
              Expanded(
                child: buildTabbar(),
                flex: 9,
              ),
              Visibility(
                  visible: widget.isShowSearch,
                  child: Expanded(
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        RouteManager.jumpPageWithAnim(
                            context,
                            SearchBar(Colors.white,
                                //需要外部传入，将searchbar界面返回掉
                                onCancelSearch: widget.onCancelSearch,
                                onSearchChange: widget.onSearchChange,
                                onSearchSubmmit: null));
                      },
                    ),
                    flex: 1,
                  ))
            ],
          ),
        ),
      ),
      body: TabBarView(
        key: ObjectKey(widget.result),
        children: widget.tabContents,
        controller: _tabController,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print("tabconmponent initState()");
    _tabController = TabController(
      length: widget.tabLabels.length,
      vsync: this,
      initialIndex: widget.result,
    );

    widget.tabs = widget.tabLabels.map((label) {
      return Tab(
        child: Text(
          label,

//不设置style,label相关样式才会生效
//            style: TextStyle
//              color: Colors.black,
//              fontSize: 14,
//            ),
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    super.dispose();
    print("tabcomponent dispose");
    _tabController.dispose();
  }

  //tabbar 页签
  Widget buildTabbar() {
    return TabBar(
      //通过给TabComponent构造函数中，加入了key之后，
      // widget.tabs！=null 的报错就解决了，但是返回到视频首页，tab的定位还没解决
      tabs: widget.tabs,

      controller: _tabController,
      isScrollable: widget.isScrollable,
      dragStartBehavior: DragStartBehavior.start,
      labelColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white, fontSize: 14),
      unselectedLabelColor: Colors.yellow,
      unselectedLabelStyle: TextStyle(color: Colors.white, fontSize: 14),
      //指示器宽度，跟随label/tab
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colors.white,
      indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
      indicatorWeight: 2,
      onTap: (index) {
        setState(() {
          widget.result = index;
        });
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
