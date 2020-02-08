import 'package:flutter/material.dart';

class FreeFlowNewsPage extends StatefulWidget {
  @override
  FreeFlowNewsPageState createState() => new FreeFlowNewsPageState();
}

class FreeFlowNewsPageState extends State<FreeFlowNewsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('免流量看新闻'),
      ),
      body: buildContents(),
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

Widget buildContents() {
  return Column(
    children: <Widget>[
      buildCardItem("网易乐卡", "电信", "内容1-----------", "内容2-----------======--"),
      buildCardItem("网易乐卡", "电信", "内容1-----------", "内容2-----------======--"),
      buildCardItem("网易乐卡", "电信", "内容1-----------", "内容2-----------======--"),
    ],
  );
}

Widget buildCardItem(String title1, String broad, String desc1, String desc2) {
  return Stack(
    children: <Widget>[
      //card
      Card(
          elevation: 14,
          margin: EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          //抗锯齿
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(
                color: Colors.yellow,
                width: 1,
                style: BorderStyle.solid,
              )),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          broad,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(45)),
//                    boxShadow: <BoxShadow>[
//                      BoxShadow(
//                        color: Colors.redAccent,
//                        blurRadius: 10,
//                      )
//                    ]
                      ),
                    )
                  ],
                ),
                Text(desc1),
                Text(desc2),
              ],
            ),
          )),
      Positioned(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.all(5),
          child: Text(
            "立即领取",
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent, width: 1),
            borderRadius: BorderRadius.circular(45),
          ),
        ),
        top: 30,
        right: 15,
      )
    ],
  );
}
