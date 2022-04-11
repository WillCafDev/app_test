import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
import 'colors_manager.dart';

const String font = 'Montserrat';
const String terminaFont = 'Termina';

const TextStyle textStyle = TextStyle(
  fontFamily: font,
  color: white80,
);

const TextStyle textStyleTermina = TextStyle(
  fontFamily: terminaFont,
  color: white80,
);

const double _display30Size = 30;
const double _display25Size = 25;
const double _display23Size = 23;
const double _display21Size = 21;
const double _headline19Size = 19;
const double _headline16Size = 16;
const double _body18Size = 18;
const double _body15Size = 15;
const double _body13Size = 13;
const double _body12Size = 12;
const double _regular11Size = 11;
const String fontFamily = 'Montserrat';
//FontWeight
const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

//class Size
const double s12 = 12;
const double s14 = 14;
const double s16 = 16;
const double s18 = 18;
const double s20 = 20;

extension BetterStyle on TextStyle {
  TextStyle get green => copyWith(color: Color.fromRGBO(43, 175, 96, 1));
  TextStyle get greenOpacity =>
      copyWith(color: Color.fromRGBO(43, 175, 96, 0.6));
  TextStyle get blue => copyWith(color: Color.fromRGBO(23, 71, 193, 1));
  TextStyle get blueOpacity =>
      copyWith(color: Color.fromRGBO(23, 71, 193, 0.6));
  TextStyle get red => copyWith(color: Color.fromRGBO(238, 96, 96, 1));
  TextStyle get blueAccent => copyWith(color: Color.fromRGBO(23, 44, 80, 1));
  TextStyle get yellow => copyWith(color: Color.fromRGBO(244, 209, 82, 1));
  TextStyle get white80 => copyWith(color: Color.fromRGBO(255, 255, 255, 0.80));
  TextStyle get white => copyWith(color: Color.fromRGBO(255, 255, 255, 1));
  TextStyle get whiteOpacity =>
      copyWith(color: Color.fromRGBO(255, 255, 255, 0.8));
  TextStyle get grey => copyWith(color: Color.fromRGBO(159, 155, 155, 1));
  TextStyle get grey100 => copyWith(color: Color.fromRGBO(189, 189, 189, 1));
  TextStyle get black80 => copyWith(color: Color.fromRGBO(23, 44, 80, 1));

  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);
}

// ignore: avoid_classes_with_only_static_members
abstract class CawafTypographyStyle {
  static TextStyle display30 = textStyle.copyWith(
    fontSize: _display30Size,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle display25 = textStyle.copyWith(
    fontSize: _display25Size,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle display23 = textStyle.copyWith(
    fontSize: _display23Size,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle display21 = textStyle.copyWith(
    fontSize: _display21Size,
    height: 1.55,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headline19 = textStyle.copyWith(
    fontSize: _headline19Size,
    height: 1.78,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headline16 = textStyle.copyWith(
    fontSize: _headline16Size,
    height: 1.37,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle body18 = textStyle.copyWith(
    fontSize: _body18Size,
    height: 1.78,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle body15 = textStyle.copyWith(
    fontSize: _body15Size,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle body13 = textStyle.copyWith(
    fontSize: _body13Size,
    height: 1.38,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle body12 = textStyle.copyWith(
    fontSize: _body12Size,
    height: 1.41,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );
  static TextStyle body10 = textStyle.copyWith(
    fontSize: _body12Size,
    height: 1.41,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle regular11 = textStyle.copyWith(
    fontSize: _regular11Size,
    height: 1.27,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle display30Termina = textStyleTermina.copyWith(
    fontSize: _display30Size,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle display25Termina = textStyleTermina.copyWith(
    fontSize: _display25Size,
    height: 1.36,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );
}
