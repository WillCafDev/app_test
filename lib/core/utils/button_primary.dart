import 'package:flutter/material.dart';

import '../template/colors_manager.dart';
import '../template/textstyle_manager.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key? key,
    this.label,
    this.onPressed,
    this.icon,
    this.color = Colors.white,
  }) : super(key: key);
  final String? label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        height: 40,
        width: 150,
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: blueOpacity,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(icon, color: color),
              Text(
                label!,
                style: CawafTypographyStyle.body13.white.w600,
              ),
            ],
          ),
        ),
      );
}
