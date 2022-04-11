import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Image.asset(
        'assets/logos/logosf.png',
        height: 100,
        width: 100,
      );
}
