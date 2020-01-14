import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentPage extends StatefulWidget {
  @override
  RecentPageState createState() => new RecentPageState();
}

class RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('最近浏览'),
      ),
      body: new Row(
        children: [
          buildChildItem('assets/image/shentidefen.png', "item1", Colors.red),
          buildChildItem('assets/image/tizhilv.png', "item2", Colors.pink),
          buildChildItem('assets/image/tizhong.png', "item3", Colors.orange),
          buildChildItem(
              'assets/image/tizhongkongzhiliang.png', "item4", Colors.blue),
        ],
      ),
    );
  }

  Widget buildChildItem(String path, String itemName, Color color) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              child: Image.asset(
                path,
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              ),
              backgroundColor: color,
              radius: 30,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                itemName,
                style: TextStyle(fontSize: 12, color: Colors.pink),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
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

  @override
  void didUpdateWidget(RecentPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
