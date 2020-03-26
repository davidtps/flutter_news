import 'package:flutter/material.dart';
import 'package:flutter_news/part2/content1/video/VideoPlayerPage.dart';
import 'package:flutter_news/part2/model/SmallVideoModel.dart';
import 'package:flutter_news/routes/RouteManager.dart';
import 'package:flutter_news/utils/GestureUtil.dart';
import 'package:video_player/video_player.dart';

/**
 * 小视频播放详情页面
 */
class SmallVideoDetailPage extends StatefulWidget {
  Data data;

  SmallVideoDetailPage(this.data);

  @override
  SmallVideoDetailPageState createState() => new SmallVideoDetailPageState();
}

class SmallVideoDetailPageState extends State<SmallVideoDetailPage> {
  VideoPlayerController controller;

  bool isInit = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
          children: <Widget>[
            VideoPlayerPage(widget.data.source),
            builtDetailTitle(context),
            builtDetailBottomLayout(),
            buildDetailRightLayout(),
          ],
        ));

//    return new Scaffold(body: Builder(
//        // Create an inner BuildContext so that the onPressed methods
//        // can refer to the Scaffold with Scaffold.of().
//        builder: (BuildContext context) {
//      return Stack(
//        children: <Widget>[
//          VideoPlayerPage(widget.data.source),
//          builtDetailTitle(context),
//          builtDetailBottomLayout(),
//          buildDetailRightLayout(),
//        ],
//      );
//    }));
  }

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.data.url);
    controller.initialize();
    controller.setVolume(102);
    controller.setLooping(false);
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
    super.dispose();
    controller.dispose();
  }

//标题栏，返回按钮和菜单按钮
  Widget builtDetailTitle(BuildContext context) {
    return Positioned(
      top: 30,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            child: Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: Colors.white,
              ),
            ),
            onTap: () {
              RouteManager.exitCurrentPage(context);
            },
          ),
          buildGesture(() {
            print("aaaaaaaaaaaaa");
            showBottomMenuDialog(context);
          },
              Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.menu,
                  size: 24,
                  color: Colors.white,
                ),
              ))
//          InkWell(
//            child: Container(
//              width: 40,
//              height: 40,
//              child: Icon(
//                Icons.menu,
//                size: 24,
//                color: Colors.white,
//              ),
//            ),
//            onTap: () {
//              showBottomMenuDialog(context);
//            },
//          )
        ],
      ),
    );
  }

  //底部的布局
  Widget builtDetailBottomLayout() {
    String playResult = "";
    double playCount = double.parse(widget.data.viewCounts);
    if (playCount > 10000) {
      double temp = playCount / 10000;
      playResult = "${temp.toStringAsFixed(1)}万"; //截取小数点后一位
    } else {
      playResult = "$playCount";
    }

    return Positioned(
      bottom: 10,
//          width: (width - 20) / 2,
      left: 10,
      right: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ClipOval(
                  child: Image.network(
                    widget.data.img,
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                "${widget.data.source}",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              new Container(
                margin: EdgeInsets.all(10),
                width: 45,
                height: 25,
                decoration: new BoxDecoration(
                  color: Colors.red,
                  //设置Borderd属性给容器添加边框
                  border: new Border.all(
                    //为边框添加颜色
                    color: Colors.redAccent,
                    width: 1, //边框宽度
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Padding(
            child: Text(
              widget.data.title,
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 30,
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: 14),
              maxLines: 1,
              cursorColor: Colors.pink,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                        style: BorderStyle.solid,
                      ))),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDetailRightLayout() {
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 100,
      right: 20,
      left: width - 70,
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.thumb_up,
                  size: 30,
                  color: Colors.white,
                ),
                onTap: () {
                  print("点赞");
                },
              ),
              Padding(
                child: Text(
                  widget.data.votecount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.message,
                size: 30,
                color: Colors.white,
              ),
              Padding(
                child: Text(
                  widget.data.replyCount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.share,
                size: 30,
                color: Colors.white,
              ),
              Padding(
                child: Text(
                  "分享",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              )
            ],
          ),
        ],
      ),
    );
  }

  void showBottomMenuDialog(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 120,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildGesture(
                          () {
                        print("收藏");
                      },
                      buildBottomSheetItem(Icons.star, "收藏"),
                    ),
                    buildGesture(
                          () {
                        print("不感兴趣");
                      },
                      buildBottomSheetItem(Icons.library_books, "不感兴趣"),
                    ),
                    buildGesture(() {
                      print("举报内容");
                    }, buildBottomSheetItem(Icons.warning, "举报内容"))
                  ],
                ),
                buildGesture(() {
                  RouteManager.exitCurrentPage(context);
                },
                    Container(
                      width: width,
                      height: 30,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          "关闭",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ))
              ],
            ),
          );
        });
//    Scaffold.of(context).showBottomSheet((context) {
//      return Container(
//        height: 120,
//        child: Column(
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                buildGesture(
//                  () {
//                    print("收藏");
//                  },
//                  buildBottomSheetItem(Icons.star, "收藏"),
//                ),
//                buildGesture(
//                      () {
//                    print("不感兴趣");
//                  },
//                  buildBottomSheetItem(Icons.library_books, "不感兴趣"),
//                ),
//                buildGesture(
//                      () {
//                    print("举报内容");
//                  },
//                    buildBottomSheetItem(Icons.warning, "举报内容")
//                )
//
//
//              ],
//            ),
//            buildGesture(
//                    () {
//                  RouteManager.exitCurrentPage(context);
//                },
//                Container(
//                  width: width,
//                  height: 30,
//                  color: Colors.white,
//                  child: Center(
//                    child: Text(
//                      "关闭",
//                      style: TextStyle(color: Colors.black, fontSize: 20),
//                    ),
//                  ),
//                )
//            )
//
//          ],
//        ),
//      );
//    });

// showBottomSheet(
//        context: context,
//        builder: (context) {
//          return Column(
//            children: <Widget>[
//              Row(
//                children: <Widget>[
//                  buildBottomSheetItem(Icons.star, "收藏"),
//                  buildBottomSheetItem(Icons.library_books, "不感兴趣"),
//                  buildBottomSheetItem(Icons.warning, "举报内容")
//                ],
//              ),
//              Container(
//                padding: EdgeInsets.all(5),
//                color: Colors.white,
//                child: Text(
//                  "关闭",
//                  style: TextStyle(color: Colors.black, fontSize: 24),
//                ),
//              )
//            ],
//          );
//        });
  }

  Widget buildBottomSheetItem(IconData icon, String subTitle) {
    return new Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Icon(
              icon,
              size: 40,
              color: Colors.black,
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
