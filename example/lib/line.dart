import 'package:flutter/material.dart';

/// 高度为 1 的灰色线条
class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey,
    );
  }
}
