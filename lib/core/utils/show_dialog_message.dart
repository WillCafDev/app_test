import 'package:flutter/material.dart';

import '../template/colors_manager.dart';
import '../template/textstyle_manager.dart';

void showDialogMessageInformation({
  required BuildContext context,
  required String message,
  String title = 'Información',
}) =>
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          children: <Widget>[
            AlertDialog(
              backgroundColor: blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    title,
                    style: CawafTypographyStyle.body18.copyWith(
                      color: yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      message,
                      style: CawafTypographyStyle.body15.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      'Aceptar',
                      style: CawafTypographyStyle.body15.copyWith(
                        color: blueAccent,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * -0.27,
              bottom: 0,
              left: 0,
              right: 0,
              child: Icon(
                Icons.info,
                size: 60,
                color: yellow,
              ),
            ),
          ],
        ),
      ),
    );

void showDialogMessageSuccess({
  required BuildContext context,
  required String message,
  required Function() funtion,
  String title = 'Proceso Completado',
}) =>
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          children: <Widget>[
            AlertDialog(
              backgroundColor: blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    title,
                    style: CawafTypographyStyle.body18.copyWith(
                      color: green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      message,
                      style: CawafTypographyStyle.body15.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  onPressed: funtion,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      'Aceptar',
                      style: CawafTypographyStyle.body15.copyWith(
                        color: blueAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * -0.27,
              bottom: 0,
              left: 0,
              right: 0,
              child: Icon(
                Icons.check_circle_rounded,
                size: 60,
                color: green,
              ),
            ),
          ],
        ),
      ),
    );
