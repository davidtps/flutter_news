import 'package:flutter/material.dart';
import 'package:flutter_news/part2/content1/SearchBar.dart';
import 'package:flutter_news/part2/content1/TabContentPage.dart';
import 'package:flutter_news/routes/RouteManager.dart';

class VideoPage extends StatefulWidget {
  @override
  VideoPageState createState() => new VideoPageState();
}

class VideoPageState extends State<VideoPage> with TickerProviderStateMixin {
  TabController videoTabControl;
  List<Tab> videoTabs;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('视频'),
        bottom: PreferredSize(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TabBar(
                  tabs: videoTabs,
                  controller: videoTabControl,
                  isScrollable: true,
                  labelColor: Colors.white,
                  onTap: (index) {
                    setState(() {
                      videoTabControl.index = index;
                    });
                  },
                  indicatorWeight: 3,
                ),
                flex: 9,
              ),
              Expanded(
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
              )
            ],
          ),
          preferredSize: Size.fromHeight(-6),
        ),
      ),
      body: TabBarView(
        children: videoTabContents,
        controller: videoTabControl,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    videoTabControl = TabController(
      length: videoTabContents.length,
      vsync: this,
      initialIndex: 1,
    );
    videoTabs = videoTabsLabels.map((label) {
      return Tab(
        child: Text(label),
      );
    }).toList();
  }

  @override
  void dispose() {
    super.dispose();
    videoTabControl.dispose();
  }
}
