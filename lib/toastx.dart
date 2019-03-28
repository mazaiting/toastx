library toastx;

import 'package:flutter/material.dart';

/// Toast tools.
class Toast {
  static void show({@required BuildContext context, @required String message}) {
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return new Positioned(
          top: MediaQuery.of(context).size.height * 0.8, // 设置距离顶部80%
          child: new Material(
            type: MaterialType.transparency, // 设置透明
            child: new Container(
              width: MediaQuery.of(context).size.width, // 设置宽度
              alignment: Alignment.center, // 设置居中
              child: new Center(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width *
                          0.8), // 设置约束，最大宽度为屏幕宽的80%
                  child: new Card(
                    child: new Padding(
                      padding: EdgeInsets.all(10),
                      child: new Text(message),
                    ),
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10))), // 设置圆角
                  ),
                ),
              ),
            ),
          ));
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    //两秒后，移除Toast
    new Future.delayed(Duration(seconds: 2)).then((value) {
      // 移除
      overlayEntry.remove();
    });
  }
}
