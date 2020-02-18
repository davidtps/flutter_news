import 'package:flutter/material.dart';
import 'package:flutter_news/part2/content1/home/RecentPage.dart';

class HomeItemListPage extends StatefulWidget {
  @override
  HomeItemListPageState createState() => new HomeItemListPageState();
}

class HomeItemListPageState extends State<HomeItemListPage> {
  List<Widget> itemWidgets;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: itemWidgets,
    );
  }

  @override
  void initState() {
    super.initState();
    itemWidgets = <Widget>[];
    itemWidgets.add(RecentPage());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
