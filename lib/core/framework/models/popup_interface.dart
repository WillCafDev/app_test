import 'package:flutter/material.dart';

abstract class PopupInterface {
  PopupInterface({
    this.solidColor,
    this.elevation,
    this.showShadow = false,
    this.canBeClosed = false,
    this.isFullScreen = false,
  });

  final bool showShadow;
  final bool canBeClosed;
  final double? elevation;
  final bool isFullScreen;
  final Color? solidColor;
  Widget build();
}
