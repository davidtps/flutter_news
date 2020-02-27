import 'package:flutter/material.dart';
import 'package:flutter_news/part2/content1/SearchBar.dart';
import 'package:flutter_news/routes/RouteManager.dart';

class TabComponent extends StatefulWidget {
  List<String> tabLabels;
  List<Widget> tabContents;
  TabController tabController;

  bool isShowSearch;

  TabComponent(this.tabLabels, this.tabContents, {this.isShowSearch = false});

  @override
  TabComponentState createState() => new TabComponentState();
}

class TabComponentState extends State<TabComponent>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('视频'),
        toolbarOpacity: 0, //可以完全隐藏title,只让bottom widget显示
        bottom: PreferredSize(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TabBar(
                  tabs: widget.tabLabels.map((label) {
                    return Tab(
                      child: Text(label),
                    );
                  }).toList(),
                  controller: widget.tabController,
                  isScrollable: true,
                  labelColor: Colors.white,
                  onTap: (index) {
                    setState(() {
                      widget.tabController.index = index;
                    });
                  },
                  indicatorWeight: 3,
                ),
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
          preferredSize: Size.fromHeight(-6),
        ),
      ),
      body: TabBarView(
        children: widget.tabContents,
        controller: widget.tabController,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.tabController = TabController(
      length: widget.tabLabels.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.tabController.dispose();
  }
}
