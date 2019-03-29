library toastx;

import 'package:flutter/material.dart';

/// Toast tool
class Toastx {
  /// OverlayDuration 实体列表
  static List<OverlayDuration> _list = List();

  /// 显示吐司
  /// @param context 上下文
  /// @param message 消息
  /// @param location 显示位置, 默认为 ToastxLocation.BOTTOM
  /// @param duration 显示时长, 默认为 ToastxDuration.SHORT
  /// @param color 背景颜色, 默认为 Colors.grey,
  /// @param style 字体风格, 无默认值
  static void show(BuildContext context, String message,
      {ToastxLocation location = ToastxLocation.BOTTOM,
      ToastxDuration duration = ToastxDuration.SHORT,
      Color color = Colors.grey,
      TextStyle style}) {
    // 获取 OverlayEntry 对象
    OverlayEntry _overlayEntry =
        _getOverlay(message, location: location, color: color, style: style);
    OverlayDuration _oDuration = OverlayDuration(_overlayEntry, duration);
    // OverlayEntry 添加
    _list.add(_oDuration);
    print(_list.length);
    // 判断长度是否为1
    if (_list.length == 1) {
      _overlayShow(context, _oDuration);
    }
  }

  /// 获取 OverlayEntry
  /// @param message 消息
  /// @param location 显示位置, 默认为 ToastxLocation.BOTTOM
  /// @param color 背景颜色, 默认为 Colors.grey,
  /// @param style 字体风格, 无默认值
  static OverlayEntry _getOverlay(String message,
      {ToastxLocation location = ToastxLocation.BOTTOM,
      Color color = Colors.grey,
      TextStyle style}) {
    //创建一个OverlayEntry对象
    return OverlayEntry(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start, // 排列方向，从开始位置
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    _getLocation(location)), // 使用 Margin 定位元素
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width *
                    0.8), // 设置约束，最大宽度为屏幕宽的80%
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10), // 内边距设置
                child: Text(message, style: style), // 字体样式
              ),
              color: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))), // 设置圆角
            ), // 卡片布局
          )
        ],
      );
      //外层使用Positioned进行定位，控制在Overlay中的位置
      // return Positioned(
      //     top: MediaQuery.of(context).size.height *
      //         _getLocation(location), // 设置距离顶部80%
      //     child: Material(
      //       type: MaterialType.transparency, // 设置透明
      //       child: Container(
      //         color: Colors.red,
      //         width: MediaQuery.of(context).size.width, // 设置宽度
      //         alignment: Alignment.center, // 设置居中

      //         child: Container(
      //           constraints: BoxConstraints(
      //               maxWidth: MediaQuery.of(context).size.width *
      //                   0.8), // 设置约束，最大宽度为屏幕宽的80%
      //           child: Card(
      //             child: Padding(
      //               padding: EdgeInsets.all(10),
      //               child: Text(message, style: style),
      //             ),
      //             color: color,
      //             shape: RoundedRectangleBorder(
      //                 borderRadius:
      //                     BorderRadius.all(Radius.circular(10))), // 设置圆角
      //           ),
      //         ),
      //       ),
      //     ));
    });
  }

  /// Overlay 显示
  /// @param context 上下文
  /// @param oDuration Overlay 与 显示时长对象
  static void _overlayShow(BuildContext context, OverlayDuration oDuration) {
    //往Overlay中插入 OverlayEntry
    Overlay.of(context).insert(oDuration.entry);
    //两秒后，移除Toast
    new Future.delayed(Duration(seconds: _getDuration(oDuration.duration)))
        .then((value) {
      // 移除
      oDuration.entry.remove();
      // 移除已经取消显示的 OverlayEntry
      _list.remove(oDuration);

      // 判断列表是否为空
      if (null != _list && _list.length > 0) {
        _overlayShow(context, _list.first);
      }
    });
  }
}

/// 获取显示位置
/// @param location 显示位置，值为 ToastxLocation 枚举
double _getLocation(ToastxLocation location) {
  // 默认为 80%
  double _precent = 0.8;
  switch (location) {
    case ToastxLocation.TOP: // 顶部
      _precent = 0.2;
      break;
    case ToastxLocation.CENTER: // 中部
      _precent = 0.5;
      break;
    case ToastxLocation.BOTTOM:
    default:
  }
  return _precent;
}

/// 获取显示时间长度
int _getDuration(ToastxDuration duration) {
  // 默认显示时间
  int second = 2;
  switch (duration) {
    case ToastxDuration.MIDDLE: // 5s
      second = 5;
      break;
    case ToastxDuration.LONG: // 10s
      second = 10;
      break;
    case ToastxDuration.SHORT:
    default:
  }
  return second;
}

/// 显示位置枚举
enum ToastxLocation {
  /// 顶部， 距离顶部 20%
  TOP,

  /// 中部， 距离顶部 50%
  CENTER,

  /// 底部， 距离顶部 50%
  BOTTOM
}

/// 显示时间枚举
enum ToastxDuration {
  /// 显示时间短，默认时间为 2s
  SHORT,

  /// 显示时间中等，默认时间为 5s
  MIDDLE,

  /// 显示时间长，默认时间为 10s
  LONG
}

/// OverlayEntry 与 Duration 实体类
class OverlayDuration {
  OverlayEntry entry;
  ToastxDuration duration;
  OverlayDuration(this.entry, this.duration);
}
