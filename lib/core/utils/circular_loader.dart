import 'package:flutter/material.dart';

import '../template/colors_manager.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(32),
        child: CircularProgressIndicator(
          color: yellow,
        ),
      );
}
