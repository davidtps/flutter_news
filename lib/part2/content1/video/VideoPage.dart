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
          child: TabBar(
            tabs: videoTabsLabels.map((label) {
              return Tab(
                child: Text(label),
//                text: label,
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
//              labelStyle: TextStyle(height: 50),
//              labelPadding: EdgeInsets.all(5),
            indicatorWeight: 3,
          ),
          preferredSize: Size.fromHeight(40),
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
