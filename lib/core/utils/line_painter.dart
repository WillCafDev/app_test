import 'package:flutter/material.dart';

import '../../../core/template/colors_manager.dart';

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintGreen = Paint()
      ..color = green
      ..style = PaintingStyle.fill;
    Paint paintBlue = Paint()
      ..color = blue
      ..style = PaintingStyle.fill;

    Path pathGreen = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.5, 0)
      ..lineTo(0, size.height * 0.27)
      ..close();
    Path pathBlue = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.05)
      ..lineTo(0, size.height * 0.32)
      ..close();

    canvas
      ..drawPath(pathBlue, paintBlue)
      ..drawPath(pathGreen, paintGreen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
