import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentPage extends StatefulWidget {
  @override
  RecentPageState createState() => new RecentPageState();
}

class RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          ListTile(
            title: Text("最近浏览"),
            trailing: Container(
              width: 100,
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Text("查看我的关注"),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildChildItem(
                  'assets/image/shentidefen.png', "item1", Colors.red),
              buildChildItem('assets/image/tizhilv.png', "item2", Colors.pink),
              buildChildItem(
                  'assets/image/tizhong.png', "item3", Colors.orange),
              buildChildItem(
                  'assets/image/tizhongkongzhiliang.png', "item4", Colors.blue),
            ],
          )
        ],
    );
  }

  Widget buildChildItem(String path, String itemName, Color color) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
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
                  Positioned(
                    right: 5,
                    bottom: 2,
                    child: Container(
                      width: 14,
                      height: 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(45)),
                          border: Border.all(
                              color: Colors.grey,
                              width: 1,
                              style: BorderStyle.solid)),
                      child: Text(
                        "V",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  itemName == "item2"
                      ? Positioned(
                          right: 15,
                          bottom: 2,
                          child: Container(
                            width: 14,
                            height: 14,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)),
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                    style: BorderStyle.solid)),
                            child: Text(
                              "V",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
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
          )),
      onTap: () {
        print("点击关注$itemName");
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
