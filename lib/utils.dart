import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tabiat_tarihi_app/tab_navigation_item.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference visitorRef = firestore.collection('tabiat-tarihi-data');

updateVisitors(String id, visits) async {
  await visitorRef.doc(id).set({'visits': visits}, SetOptions(merge: true));
}

BottomNavigationBar buildBottomNavigationBar(
  BuildContext context,
  int index,
  function,
) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.shifting,
    selectedIconTheme: IconThemeData(
      size: 28.0,
      color: Color(0xff252468),
      opacity: 1.0,
    ),
    unselectedIconTheme: IconThemeData(
      color: Color(0xff252468),
      opacity: 0.3,
    ),
    selectedItemColor: Color(0xff252468),
    showUnselectedLabels: true,
    showSelectedLabels: true,
    currentIndex: index,
    onTap: function,
    items: <BottomNavigationBarItem>[
      for (final tabItem in TabNavigationItem.getTabItems(context))
        BottomNavigationBarItem(
          icon: tabItem.icon,
          label: tabItem.label,
        ),
    ],
  );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

TextStyle SafeGoogleFont(
  String fontFamily, {
  TextStyle? textStyle,
  Color? color,
  Color? backgroundColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
}) {
  try {
    return GoogleFonts.getFont(
      fontFamily,
      textStyle: textStyle,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  } catch (ex) {
    return GoogleFonts.getFont(
      "Source Sans Pro",
      textStyle: textStyle,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }
}
