import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/part2/model/SmallVideoModel.dart';
import 'package:video_player/video_player.dart';

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
    List<String> dataSources = [];
    return FutureBuilder(
//      future: DefaultAssetBundle.of(context).loadString("assets/videos.json"),
      future: rootBundle.loadString("assets/videos.json"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          SmallVideoModel smallVideoModel =
          SmallVideoModel.fromJson(json.decode(snapshot.data));
          for (int i = 0; i < smallVideoModel.data.length; i++) {
//            print(smallVideoModel.data[i].url);
            dataSources.add(smallVideoModel.data[i].url);
          }
          return buildVideoGridView(dataSources);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

Widget buildVideoGridView(List<String> dataSources) {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 5,
    crossAxisSpacing: 5,
    childAspectRatio: 9 / 16,
    children: dataSources.map((data) {
//      print(data);
      return VideoPlayerPage(data);
    }).toList(),
  );
}

class VideoPlayerPage extends StatefulWidget {
  String dataSource;

  VideoPlayerPage(this.dataSource);

  @override
  VideoPlayerPageState createState() => new VideoPlayerPageState();
}

class VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController controller;
  bool isInit = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return new GestureDetector(
      //追加手势点击事件
      child: Column(
        children: <Widget>[
          SizedBox(
            width: width,
            height: 300,
            child: isInit
                ? VideoPlayer(controller)
                : Container(
              color: Colors.teal,
            ),
          ),
          //进度条，视频初始化结束后就隐藏掉
          Visibility(
              visible: true, //!isInit,
              child: Container(
                height: 10,
                child: VideoProgressIndicator(
                  controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                      backgroundColor: Colors.grey,
                      bufferedColor: Colors.yellow,
                      playedColor: Colors.redAccent[200]),
                ),
              )),
        ],
      ),
      onTap: () {
        if (controller.value.isPlaying) {
          controller.pause();
        } else {
          controller.play();
        }
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.dataSource);
    controller.initialize();
    controller.setVolume(102);
    controller.setLooping(true);
    controller.addListener(() {
      print(controller.value);

      if (isInit != controller.value.initialized) {
        isInit = controller.value.initialized;
        setState(() {});
      }
      //播放错误输出日志
      if (controller.value.hasError) {
        print(controller.value.errorDescription);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
