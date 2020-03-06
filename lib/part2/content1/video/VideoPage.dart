import 'package:flutter/material.dart';
import 'package:flutter_news/part2/content1/TabContentPage.dart';
import 'package:flutter_news/widget/TabComponent.dart';

class VideoPage extends StatefulWidget {
  @override
  VideoPageState createState() => new VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return TabComponent(
      videoTabsLabels,
      videoTabContents,
      isShowSearch: true,
      onSearchChange: _onSearchChange,
      onCancelSearch: _onCancelSearch,
      backgroundColor: Colors.redAccent,
      key: ObjectKey(new VideoPage()),
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

  void _onCancelSearch() {
    Navigator.pop(context);
  }

  void _onSearchChange(String data) {
    print("tabcomponent $data");
  }
}
