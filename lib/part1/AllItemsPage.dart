import 'package:flutter/material.dart';
import 'package:flutter_news/utils/Toast.dart';

class AllItemsPage extends StatefulWidget {
  @override
  AllItemsPageState createState() => new AllItemsPageState();
}

class AllItemsPageState extends State<AllItemsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('全部栏目'),
      ),
      body: buildWidgetPage(context), //buildContentsViewExample(),
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

Widget buildWidgetPage(BuildContext context) {
  List<String> datas = [
    '关注',
    '头条',
    '视频',
    '娱乐',
    '体育',
    '新时代',
    '要闻',
    '段子',
    '知否',
    '上海',
    '公开课',
    '圈子',
    '财经',
    '科技',
    '汽车',
    '网易号',
    '军事',
    '时尚',
    '跟帖',
    '直播',
    '图片',
    '小视频',
    'NBA',
    '热点',
    '房产',
    '股票',
    '轻松一刻',
    '历史',
    '家居',
    '播单',
    '独家',
    '游戏',
    '健康',
    '航空',
    '小说',
    '热度',
  ];
  double width = MediaQuery.of(context).size.width;
  return SizedBox(
    width: width,
    child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 5,
        children: datas.map((data) {
          return buildChipItem(context, data); //需要有return
        }).toList()),
  );
}

Widget buildChipItem(BuildContext context, String data) {
  return ActionChip(
    backgroundColor: Colors.white,
    label: Container(
      child: Center(
        child: Text(data),
      ),
      width: 50,
    ),
    labelStyle: TextStyle(
        color: data == "头条" ? Colors.red : Colors.black, fontSize: 12),
    //阴影大小
    elevation: 2,
//    //阴影颜色
//    shadowColor: Colors.redAccent,
    padding: EdgeInsets.symmetric(horizontal: 5),
    autofocus: true,
    focusNode: FocusNode(debugLabel: '关注'),
    onPressed: () {
      print(data);
      Toast.toast(context, msg: data, position: ToastPostion.bottom);
    },

    materialTapTargetSize: MaterialTapTargetSize.padded,
    clipBehavior: Clip.antiAlias,

    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          style: BorderStyle.solid,
          color: Colors.grey[200],
          width: 1,
        )),
  );
}

Widget buildContentsViewExample() {
  return
      //      Column(
//        children: <Widget>[
//          SizedBox(
//            width: 100,
//            height: 100,
//            child: Container(
//              width: 50,
//              height: 100,
//              color: Colors.blue,
//            ),
//          ),
//          SizedBox(
//            width: 100,
//            height: 100,
//            child: Container(
//              width: 50,
//              height: 1900,
//              color: Colors.yellow,
//            ),
//          ),
//          SizedBox(
//            width: 100,
//            height: 100,
//            child: Container(
//              width: 50,
//              height: 100,
//              color: Colors.redAccent,
//            ),
//          ),
//          SizedBox(
//            width: 100,
//            height: 100,
//            child: Container(
//              width: 50,
//              height: 50,
//              color: Colors.pink,
//            ),
//          )
//        ],
//      ),

//            Wrap(
//          crossAxisAlignment: WrapCrossAlignment.start,
//          spacing: 5,
//          direction: Axis.horizontal,
//          alignment: WrapAlignment.spaceBetween,
//          runSpacing: 5,
//          children: <Widget>[
//            Container(
//              width: 100,
//              height: 100,
//              color: Colors.pink,
//            ),
//            Container(
//              width: 100,
//              height: 100,
//              color: Colors.yellow,
//            ),
//            Container(
//              width: 100,
//              height: 100,
//              color: Colors.redAccent,
//            ),
//            Container(
//              width: 100,
//              height: 100,
//              color: Colors.teal,
//            ),
//            Container(
//              width: 100,
//              height: 100,
//              color: Colors.yellow,
//            ),
//          ],

//            Row(children: <Widget>[
//          Expanded(
//            child: Container(
//              width: 100,
//              height: 100,
//              color: Colors.yellow,
//            ),
//            flex: 5,
//          ),
//          Expanded(
//            child: Container(
//              width: 100,
//              height: 100,
//              color: Colors.teal,
//            ),
//            flex: 3,
//          ),
//          Expanded(
//            child: Container(
//              width: 100,
//              height: 100,
//              color: Colors.red,
//            ),
//            flex: 1,
//          )
//        ])
      Chip(
    backgroundColor: Colors.white,
    label: Text("汽车"),
    labelStyle: TextStyle(color: Colors.red),
    //阴影大小
    elevation: 5,
    //阴影颜色
    shadowColor: Colors.redAccent,
    padding: EdgeInsets.symmetric(horizontal: 5),
    //左侧按钮
    avatar: CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.add,
        color: Colors.red,
      ),
    ),
    //右侧按钮的颜色 直接作用于onDeleted属性值
    deleteIconColor: Colors.green,
    // deleteIcon自定义按钮 需要和onDeleted一起使用,才会显示
//          deleteIcon: Icon(
//            Icons.delete,
//            size: 20,
//            color: Colors.blue,
//          ),
    //右侧按钮的点击事件  直接使用自有一个默认的黑色叉叉按钮
    onDeleted: () {
      print("delete click");
    },
    deleteButtonTooltipMessage: "删除tips",
    clipBehavior: Clip.antiAlias,

    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          style: BorderStyle.solid,
          color: Colors.red[200],
          width: 1,
        )),
  );
}
