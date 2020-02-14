import 'package:flutter/material.dart';

typedef SearchChangeCallback = void Function(String data);

class SearchBar extends StatefulWidget {
  Color statusbarcolor = Colors.white;

  VoidCallback onCancelSearch;
  SearchChangeCallback onSearchChange;

  SearchBar(
    this.statusbarcolor, {
    Key key, //保存页面状态使用？？？  如何使用？？
    @required this.onCancelSearch,
    @required this.onSearchChange,
  }) : super(key: key);

  @override
  SearchBarState createState() => new SearchBarState();
}

/// 键盘设置
//    TextInputType keyboardType,
//    this.keyboardAppearance,
//    this.textInputAction,
//    this.textCapitalization = TextCapitalization.none,

/// 输入框的外观装饰设置
//    this.decoration = const InputDecoration(),
//    this.buildCounter,
//    this.style,
//    this.strutStyle,
//    this.textAlign = TextAlign.start,
//    this.textAlignVertical,
//    this.textDirection,

/// 文字有关的：
//    this.obscureText = false,
//    this.readOnly = false,
//    ToolbarOptions toolbarOptions,
//    this.autocorrect = true,
//    this.maxLines = 1,
//    this.minLines,
//    this.expands = false,
//    this.maxLength,
//    this.maxLengthEnforced = true,

/// 光标和焦点设置
//    this.enabled,
//    this.autofocus = false,
//    this.focusNode,
//    this.showCursor,
//    this.cursorWidth = 2.0,
//    this.cursorRadius,
//    this.cursorColor,
//    this.enableInteractiveSelection = true,
//    this.inputFormatters,

/// 监听
//    this.onChanged,
//    this.onEditingComplete,
//    this.onSubmitted,
//    this.onTap,

/// 滑动属性
//    this.scrollController,
//    this.scrollPhysics,
//    this.scrollPadding = const EdgeInsets.all(20.0),
//    this.dragStartBehavior = DragStartBehavior.start,
class SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: widget.statusbarcolor,
        leading: IconButton(
          padding: EdgeInsets.all(5),
          icon: Icon(
            Icons.navigate_before,
            color: Colors.grey,
            size: 30,
          ),
          onPressed: widget.onCancelSearch,
        ),
        titleSpacing: 0, //leading控件和输入框的间距
        title: TitleContent(),
      ),
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

  Widget TitleContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 30,
          width: 250,
          margin: EdgeInsets.all(5),
          child: Center(
            child: TextField(
              //键盘类型
              keyboardType: TextInputType.phone,
              //键盘主题
              keyboardAppearance: Brightness.light,
              //键盘回车键的按钮类型
              textInputAction: TextInputAction.search,
              //键盘输入类型（英文大写、小写、文字、数字等）
              textCapitalization: TextCapitalization.characters,

              controller: TextEditingController(text: ""),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  //hint
                  hintText: "搜索关键字",
                  hintStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 15,
                  ),

                  //前缀图标、文字prefixText等
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey,
                  ),
                  //后缀图标、文字prefixText等
                  suffixIcon: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                        style: BorderStyle.solid,
                      )),
//                      focusColor: Colors.black38,
//                      labelStyle: TextStyle(
//                          color: Colors.grey,
//                          fontSize: 15,
//                          backgroundColor: Colors.blue),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors.blue[200],
                          style: BorderStyle.solid))),
              maxLines: 1,
              autofocus: true,
//                  textAlign: TextAlign.justify,
              //光标颜色
              cursorColor: Colors.pink,
//                  textAlignVertical: TextAlignVertical.center, //???
            ),
          ),
        ),
        Padding(
          child: Text(
            "搜索",
            style: TextStyle(color: Colors.black38, fontSize: 16),
          ),
          padding: EdgeInsets.all(5),
        ),
      ],
    );
  }
}
