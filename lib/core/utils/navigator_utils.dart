import 'package:flutter/material.dart';

Future<void> pushToPage(BuildContext context, String route,
    {dynamic arguments}) async {
  await Navigator.of(context).pushNamed(route, arguments: arguments);
}

Future<void> pushAndReplaceToPage(BuildContext context, Widget widget) async {
  await Navigator.of(context).pushReplacement(
    MaterialPageRoute<Object>(builder: (_) => widget),
  );
}

Future<void> popAllAndPush(BuildContext context, Widget widget) async {
  await Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute<Object>(builder: (BuildContext context) => widget),
    ModalRoute.withName('/'),
  );
}

Future<void> pushNamedAndRemoveUntil(BuildContext context, String route) async {
  await Navigator.of(context)
      .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
}

Future<void> pushReplacementNamed(BuildContext context, String route) async {
  await Navigator.pushReplacementNamed(context, route);
}
