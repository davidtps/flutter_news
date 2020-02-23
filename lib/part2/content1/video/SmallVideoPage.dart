import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SmallVideoPage extends StatefulWidget {
  @override
  SmallVideoPageState createState() => new SmallVideoPageState();
}

class SmallVideoPageState extends State<SmallVideoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('小视频'),
//      ),

//      body: GridView(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 2,
//            mainAxisSpacing: 5,
//            crossAxisSpacing: 5,
//            childAspectRatio: 1),
//        children: <Widget>[
//          Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          ),
//          Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          ),
//          Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          ),
//          Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          ),
//          Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          ),
//          Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          ),
//          Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          )
//        ],
//      ),

//      body: GridView.count(
//        crossAxisCount: 2,
//        crossAxisSpacing: 5,
//        mainAxisSpacing: 5,
//        childAspectRatio: 9/16,
//        children: <Widget>[
//          Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          ), Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          ), Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          ), Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          ), Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          ),
//        ],
//      ),
//      body: GridView.builder(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 2,
//            mainAxisSpacing: 5,
//            crossAxisSpacing: 5,
//            childAspectRatio: 1),
//        itemBuilder: (BuildContext context, int index) {
//          return Container(
//            width: 50,
//            height: 50,
//            color: Colors.teal,
//          );
//        },
//        itemCount: 20,
//      ),

//      body: GridView.custom(
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//              crossAxisCount: 3,
//              mainAxisSpacing: 5,
//              crossAxisSpacing: 5,
//              childAspectRatio: 1),
//          childrenDelegate: SliverChildListDelegate([
//            Container(
//              width: 50,
//              height: 50,
//              color: Colors.teal,
//            ),
//            Container(
//              width: 50,
//              height: 50,
//              color: Colors.teal,
//            ),
//            Container(
//              width: 50,
//              height: 50,
//              color: Colors.teal,
//            ),
//            Container(
//              width: 50,
//              height: 50,
//              color: Colors.teal,
//            ),
//            Container(
//              width: 50,
//              height: 50,
//              color: Colors.teal,
//            ),
//            Container(
//              width: 50,
//              height: 50,
//              color: Colors.teal,
//            )
//          ])),
      body: buildVideoGridView(),
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

  List<String> initItemDatas() {
    List<String> datas = [
      'https://storage.googleapis.com/coverr-main/mp4%2Fcoverr-clear-water-1559888911402.mp4',
      'https://storage.googleapis.com/coverr-main/mp4%2Fcoverr-breathtaking-reflection-1572023479601.mp4',
      'https://storage.googleapis.com/coverr-main/mp4%2FHeaven.mp4',
      'https://storage.googleapis.com/coverr-main/mp4%2FOne-Swan.mp4',
      'https://storage.googleapis.com/coverr-main/mp4%2Fcoverr-sunshine-between-white-grapes-1570036541225.mp4',
      'https://storage.googleapis.com/coverr-main/mp4%2Fcoverr-clear-water-1559888911402.mp4',
      'https://storage.googleapis.com/coverr-main/mp4%2Fcoverr-breathtaking-reflection-1572023479601.mp4',
      'https://storage.googleapis.com/coverr-main/mp4%2FHeaven.mp4',
      'https://storage.googleapis.com/coverr-main/mp4%2FOne-Swan.mp4',
      'https://storage.googleapis.com/coverr-main/mp4%2Fcoverr-sunshine-between-white-grapes-1570036541225.mp4',
    ];
    return datas;
  }

  Widget buildVideoGridView() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      childAspectRatio: 9 / 16,
      children: initItemDatas().map((data) {
        return VideoPlayerPage(data);
      }).toList(),
    );
  }
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
