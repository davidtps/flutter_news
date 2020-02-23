import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/part2/content1/home/RecentPage.dart';
import 'package:flutter_news/part2/model/NewsModel.dart';

class HomeItemListPage extends StatefulWidget {
  @override
  HomeItemListPageState createState() => new HomeItemListPageState();
}

class HomeItemListPageState extends State<HomeItemListPage> {
  List<Widget> itemWidgets;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return FutureBuilder(
      future: rootBundle.loadString("assets/news.json"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          NewsModel newsModel = NewsModel.fromJson(json.decode(snapshot.data));
          print(newsModel.data[0].infos);
//          NewsModel newsModel = newsModelFromJson(snapshot.data);
          for (var data in newsModel.data) {
            switch (data.type) {
              case "1":
                itemWidgets.add(buildItem1(data));
                itemWidgets.add(Divider(
//                  thickness: 1,
                  height: 1,
                  color: Colors.grey,
                ));
                break;
              case "2":
                itemWidgets.add(buildItem2(data));
                itemWidgets.add(Divider(
//                  thickness: 1,
                  height: 1,
                  color: Colors.grey,
                ));
                break;
              case "3":
                itemWidgets.add(buildItem3(width, data));
                itemWidgets.add(Divider(
//                  thickness: 1,
                  height: 1,
                  color: Colors.grey,
                ));
                break;
            }
          }

          return ListView(
            children: itemWidgets,
          );
        } else {
          return Container(
            padding: EdgeInsets.all(100),
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
            width: 60,
            height: 60,
          );
        }
      },
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
    super.dispose();
  }

  Widget buildItem1(Data data) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data.title,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Row(
            children: <Widget>[
              bulidTag(data.tag),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  data.source,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              buildFollowUpWidget(data.votecount),
            ],
          )
        ],
      ),
    );
  }

  Widget buildItem2(Data data) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Row(
                  children: <Widget>[
                    bulidTag(data.tag),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        data.source,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    buildFollowUpWidget(data.votecount),
                  ],
                )
              ],
            ),
          ),
          flex: 7,
        ),
        Expanded(
          child: Image.asset(
            data.thumb,
            width: 100,
            height: 60,
          ),
          flex: 3,
        )
      ],
    );
  }

  Widget buildItem3(double width, Data data) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data.title,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          buildShowListImages(width, data.images),
          Row(
            children: <Widget>[
              bulidTag(data.tag),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  data.source,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              buildFollowUpWidget(data.votecount),
            ],
          )
        ],
      ),
    );
  }

  Widget bulidTag(String tag) {
    if (tag != null) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            tag,
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
        );
    } else {
      print("adfsdfsdfsdff  tag 为null");
    }
  }

  //跟帖数量布局
  Widget buildFollowUpWidget(String votecount) {
    if (int.parse(votecount) > 2000) {
      return new Container(
        height: 20,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: new Border.all(
            //为边框添加颜色
              color: Colors.red,
              width: 1, //边框宽度
              style: BorderStyle.solid),
        ),
        child: Text(
          "$votecount跟帖",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      );
    } else {
      return Text(
        "$votecount跟帖",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      );
    }
  }

  //列表中图片展示 一张占一行；三张均分占用
  Widget buildShowListImages(double width, List<Images> images) {
    if (images.length == 1) {
      return Padding(
          padding: EdgeInsets.all(10),
          child: Image.asset(
            images[0].imgsrc,
            width: width - 50,
            height: 50,
            fit: BoxFit.fill,
          ));
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: images.map((data) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(
                data.imgsrc,
                width: (width - 60) / 3,
                height: 50,
                fit: BoxFit.fill,
              ));
        }).toList(),
      );
    }
  }
}
