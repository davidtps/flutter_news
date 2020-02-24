import 'package:flutter/material.dart';
import 'package:flutter_news/part2/content1/TabContentPage.dart';

class VideoPage extends StatefulWidget {
  @override
  VideoPageState createState() => new VideoPageState();
}

class VideoPageState extends State<VideoPage> with TickerProviderStateMixin {
  TabController videoTabControl;

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
                  tabs: videoTabsLabels.map((label) {
                    return Tab(
                      child: Text(label),
                    );
                  }).toList(),
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
                child: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.grey,
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
  }

  @override
  void dispose() {
    super.dispose();
    videoTabControl.dispose();
  }
}
