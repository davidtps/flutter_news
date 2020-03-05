import 'package:flutter/material.dart';
import 'package:flutter_news/part2/content1/TabContentPage.dart';
import 'package:flutter_news/widget/TabComponent.dart';

class VideoPage extends StatefulWidget {
  @override
  VideoPageState createState() => new VideoPageState();
}

class VideoPageState extends State<VideoPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabComponent(
      videoTabsLabels,
      videoTabContents,
      isShowSearch: true,
      backgroundColor: Colors.redAccent,
    );
  }

  @override
  void initState() {
    super.initState();
    print("video initState()");
  }

  @override
  void dispose() {
    super.dispose();
    print("video dispose");
  }
}
