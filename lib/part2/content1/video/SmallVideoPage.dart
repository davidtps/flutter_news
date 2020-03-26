import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/part2/content1/video/SmallVideoDetailPage.dart';
import 'package:flutter_news/part2/model/SmallVideoModel.dart';
import 'package:flutter_news/routes/RouteManager.dart';

/**
 * 小视频页面
 */
class SmallVideoPage extends StatefulWidget {
  @override
  SmallVideoPageState createState() => new SmallVideoPageState();
}

class SmallVideoPageState extends State<SmallVideoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: buildBodyView(),
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

  Widget buildBodyView() {
    List<Data> dataSources = [];
    return FutureBuilder(
//      future: DefaultAssetBundle.of(context).loadString("assets/videos.json"),
      future: rootBundle.loadString("assets/videos.json"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          SmallVideoModel smallVideoModel =
          SmallVideoModel.fromJson(json.decode(snapshot.data));
          for (int i = 0; i < smallVideoModel.data.length; i++) {
            Data data = smallVideoModel.data[i];

//            dataSources.add(smallVideoModel.data[i].url);
            dataSources.add(data);
          }
          return buildVideoGridView(dataSources);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

Widget buildVideoGridView(List<Data> dataSources) {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 5,
    crossAxisSpacing: 5,
    childAspectRatio: 9 / 16,
    children: dataSources.map((data) {
//      print(data);
      return VideoPlayerThumbnailPage(data);
    }).toList(),
  );
}

class VideoPlayerThumbnailPage extends StatefulWidget {
  Data dataSource;

  VideoPlayerThumbnailPage(this.dataSource);

  @override
  VideoPlayerThumbnailPageState createState() =>
      new VideoPlayerThumbnailPageState();
}

class VideoPlayerThumbnailPageState extends State<VideoPlayerThumbnailPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return new GestureDetector(
      //追加手势点击事件
      child: Column(
        children: <Widget>[
          SizedBox(
            width: width,
            child: buildVideoItem(widget.dataSource),
          ),
        ],
      ),
      onTap: () {
        RouteManager.jumpPageCommon(
            context, SmallVideoDetailPage(widget.dataSource));
      },
    );
  }

  Widget buildVideoItem(Data data) {
    String playResult = "";
    double playCount = double.parse(data.viewCounts);
    if (playCount > 10000) {
      double temp = playCount / 10000;
      playResult = "${temp.toStringAsFixed(1)}万"; //截取小数点后一位
    } else {
      playResult = "$playCount";
    }
    return Stack(
      children: <Widget>[
        Container(
          height: 315,
          color: Colors.teal,
        ),
        Positioned(
          bottom: 10,
//          width: (width - 20) / 2,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                child: Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "${playResult}次播放",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "${data.votecount}人点赞",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
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
