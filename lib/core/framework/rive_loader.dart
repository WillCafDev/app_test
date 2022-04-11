import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'models/popup_interface.dart';

class RivePopup extends PopupInterface {
  RivePopup({
    required this.path,
    required this.animation,
    this.size = 80,
    bool canBeClosed = false,
    bool showShadow = true,
  }) : super(
          canBeClosed: canBeClosed,
          showShadow: showShadow,
        );

  final String path;
  final String animation;
  final double size;

  @override
  Widget build() => _RiveWidget(
        animation: animation,
        path: path,
        size: size,
      );
}

class _RiveWidget extends StatefulWidget {
  const _RiveWidget({
    required this.animation,
    required this.path,
    required this.size,
    Key? key,
  }) : super(key: key);
  final String path;
  final String animation;
  final double size;

  @override
  __RiveWidgetState createState() => __RiveWidgetState();
}

class __RiveWidgetState extends State<_RiveWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        width: widget.size,
        height: widget.size,
        child: RiveAnimation.asset(
          widget.path,
        ),
      );
}
