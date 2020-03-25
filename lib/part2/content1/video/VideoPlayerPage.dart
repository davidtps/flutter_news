import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/**
 * 视频播放页面
 */
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
    double height = MediaQuery.of(context).size.height;
    return new GestureDetector(
      //追加手势点击事件
      child: Column(
        children: <Widget>[
          SizedBox(
            width: width,
            height: height - 10,
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
