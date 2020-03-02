import 'package:flutter/material.dart';
import 'package:flutter_news/part2/content1/SearchBar.dart';
import 'package:flutter_news/routes/RouteManager.dart';

class TabComponent extends StatefulWidget {
  List<String> tabLabels;
  List<Widget> tabContents;

  bool isShowSearch;

  TabComponent(this.tabLabels,
      this.tabContents, {
        this.isShowSearch = false,
      });

  @override
  TabComponentState createState() => new TabComponentState();
}

class TabComponentState extends State<TabComponent>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('视频'),
        toolbarOpacity: 0, //可以完全隐藏title,只让bottom widget显示；可以直接让title为对应的widget
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
                            SearchBar(Colors.white, onCancelSearch: () {
                              Navigator.pop(context);
                            }, onSearchChange: null, onSearchSubmmit: null));
                      },
                    ),
                    flex: 1,
                  ))
            ],
          ),
        ),
      ),
      body: TabBarView(
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
      initialIndex: 0,
    );
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
      tabs: widget.tabLabels.map((label) {
        return Tab(
          child: Text(label),
        );
      }).toList(),
      controller: _tabController,
      isScrollable: true,
      labelColor: Colors.white,
      indicatorWeight: 3,
      onTap: (index) {
        setState(() {
          _tabController.index = index;
        });
      },
    );
  }
}
