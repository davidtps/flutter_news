import 'package:flutter/material.dart';
import 'package:flutter_news/part2/content1/TabContentPage.dart';
import 'package:flutter_news/widget/TabComponent.dart';

class HotPage extends StatefulWidget {
  @override
  HotPageState createState() => new HotPageState();
}

class HotPageState extends State<HotPage> {
  @override
  Widget build(BuildContext context) {
    return TabComponent(
      hotTabsLabels,
      hotTabContents,
      isShowSearch: false,
      isScrollable: false,
      selectLabelColor: Colors.red,
      unSelectLabelColor: Colors.black,
      indicatorColor: Colors.red,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      key: ObjectKey(new HotPage()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
