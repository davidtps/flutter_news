import 'package:flutter/material.dart';
import 'package:flutter_news/utils/SharedPreferenceUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountSettingsPage extends StatefulWidget {
  @override
  AccountSettingsPageState createState() => new AccountSettingsPageState();
}

class AccountSettingsPageState extends State<AccountSettingsPage> {
  double fontsize1 = 18;
  double fontsize2 = 16;
  double fontsize3 = 12;
  Color subTextColor = Colors.grey;
  double rowHeight = 70;
  bool _isCheck = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        title: new Text('账户设置'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              //leading 同样效果
              "账号",
              style: TextStyle(color: Colors.black, fontSize: fontsize1),
            ),
            trailing: Text(
              "tianpengsheng@hisense.com",
              style: TextStyle(fontSize: fontsize3, color: subTextColor),
            ),
          ),
          Divider(thickness: 0.5, color: Colors.grey[300]),
          ListTile(
            title: Text("绑定手机号",
                style: TextStyle(fontSize: fontsize1, color: Colors.black)),
            subtitle: Text(
              "绑定手机后可通过手机快捷登录",
              style: TextStyle(fontSize: fontsize3, color: subTextColor),
            ),
            trailing: Container(
              width: 80,
              height: rowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "去绑定",
                    style: TextStyle(fontSize: fontsize2, color: Colors.red),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 16,
                  )
                ],
              ),
            ),
            onTap: () {
              print("去绑定点击");
            },
          ),
          Divider(thickness: 5, color: Colors.grey[300]),
          ListTile(
            title: Text(
              "头像",
              style: TextStyle(color: Colors.black, fontSize: fontsize1),
            ),
            trailing: Container(
              //需要加上宽高限制！！
              width: 80,
              height: rowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ClipOval(
                    //图片裁剪的使用，圆形图片
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "assets/image/head.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
          Divider(thickness: 0.5, color: Colors.grey[300]),
          ListTile(
            title: Text(
              "头像挂件",
              style: TextStyle(color: Colors.black, fontSize: fontsize1),
            ),
            trailing: Container(
              width: 80,
              height: rowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "未设置",
                    style: TextStyle(fontSize: fontsize2, color: subTextColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
          Divider(thickness: 0.5, color: Colors.grey[300]),
          ListTile(
            title: Text(
              "昵称",
              style: TextStyle(color: Colors.black, fontSize: fontsize1),
            ),
            trailing: Container(
              width: 80,
              height: rowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "davidtps",
                    style: TextStyle(fontSize: fontsize2, color: subTextColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
          Divider(thickness: 0.5, color: Colors.grey[300]),
          ListTile(
            title: Text(
              "生日",
              style: TextStyle(color: Colors.black, fontSize: fontsize1),
            ),
            trailing: Container(
              width: 100,
              height: rowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "19890125",
                    style: TextStyle(fontSize: fontsize2, color: subTextColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
          Divider(thickness: 0.5, color: Colors.grey[300]),
          ListTile(
            title: Text(
              "性别",
              style: TextStyle(color: Colors.black, fontSize: fontsize1),
            ),
            trailing: Container(
              width: 100,
              height: rowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "男",
                    style: TextStyle(fontSize: fontsize2, color: subTextColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
          Divider(thickness: 5, color: Colors.grey[300]),
          SwitchListTile(
            title: Text(
              "匿名跟帖",
              style: TextStyle(color: Colors.black, fontSize: fontsize1),
            ),
            subtitle: Text(
              "其他网友不会看到你的用户名",
              style: TextStyle(color: subTextColor, fontSize: fontsize3),
            ),
            value: _isCheck,
            onChanged: _check_change,
          ),
          Divider(thickness: 0.5, color: Colors.grey[300]),
          ListTile(
            title: Text(
              "跟帖设备名称",
              style: TextStyle(color: Colors.black, fontSize: fontsize1),
            ),
            trailing: Container(
              width: 120,
              height: rowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Android手机",
                    style: TextStyle(fontSize: fontsize2, color: subTextColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 45,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(45)),
            child: Center(
                child: Text(
              "登出",
              style: TextStyle(fontSize: fontsize1, color: Colors.white),
            )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "永久注销账号",
                  style: TextStyle(color: subTextColor, fontSize: fontsize3),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 16,
                )
              ],
            ),
          )
        ],
        scrollDirection: Axis.vertical,
      ),
    );
  }

  void _check_change(isCheck) {
    setState(() {
      _isCheck = isCheck;
    });
    SharedPreferenceUtil.setBool("niming_switch_value", _isCheck);
    print(SharedPreferenceUtil.getBool("niming_switch_value"));
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
