import 'package:flutter/material.dart';

class SquarePage extends StatefulWidget {
  @override
  SquarePageState createState() => new SquarePageState();
}

class SquarePageState extends State<SquarePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('圈子'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.6,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 50,
              height: 50,
              child: buildSquareItem(
                  "assets/image/shopping3.png", "奥术大师大所多撒多所大所多", "19万人关注"),
            );
          },
          itemCount: 8,
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
}

Widget buildSquareItem(String imagePath, String title, String attentionCount) {
  //    return Padding(
  ////      padding: EdgeInsets.all(10),
  ////      padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
  ////      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
  //      child: Container(
  //        width: 100,
  //        height: 100,
  //        color: Colors.teal,
  //      ),
  //    );

  //    return Container(
  //      width: 300,
  //      height: 300,
  //      color: Colors.teal,
  //      child: Align(
  ////        alignment: Alignment.topLeft,
  //        alignment: Alignment(0.4, -0.2),
  //        child: new Text('文字内容'),
  //      ),
  //    );

  //    return Container(
  //      width: 300,
  //      height: 300,
  //      color: Colors.teal,
  //      child: Center(
  //        child: Container(
  //          width: 100,
  //          height: 100,
  //          color: Colors.red,
  //          child: new Text('文字内容'),
  //        ),
  //      ),
  //    );

  //    return Stack(
  //      children: <Widget>[
  //        Container(width: 100, height: 100, color: Colors.lightBlueAccent),
  //        Container(width: 75, height: 75, color: Colors.orangeAccent),
  //        Container(width: 50, height: 50, color: Colors.green),
  ////        Container(width: 50, height: 50, color: Colors.green),
  ////        Container(width: 100, height: 100, color: Colors.lightBlueAccent),
  ////        Container(width: 75, height: 75, color: Colors.orangeAccent),
  //      ],
  //      alignment: AlignmentDirectional.center,
  ////      alignment: Alignment.centerRight,
  //    );

  //    return Stack(
  //      children: <Widget>[
  //        Positioned(
  //          child:
  //              Container(width: 100, height: 100, color: Colors.lightBlueAccent),
  //          left: 20,
  //          right: 20,
  //        ),
  //        Positioned(
  //          child: Container(width: 75, height: 75, color: Colors.orangeAccent),
  //          top: 20,
  //          bottom: 20,
  //        ),
  //        Positioned(
  //          child: Container(width: 50, height: 50, color: Colors.green),
  //          left: 20,
  //          width: 60,
  //        ),
  //      ],
  //      alignment: AlignmentDirectional.topStart,
  //    );

  return Column(
    children: <Widget>[
      Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(imagePath),
                borderRadius: BorderRadius.circular(5),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Icon(
              Icons.add_circle,
              color: Colors.red,
            ),
          )
        ],
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Align(
            //左对齐操作
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 14, color: Colors.black),
            )),
      ),
      Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Align(
            //左对齐操作
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              attentionCount,
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.left,
            ),
          ))
    ],
  );
}
