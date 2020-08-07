import 'package:flutter/material.dart';

import 'theme_color.dart';

ThemeData appTheme(BuildContext context) => ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'GoogleSans',
    primaryColor: AppColor.primaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primaryColor,
      splashColor: AppColor.buttonSplashColor,
      highlightColor: AppColor.primaryColor.withOpacity(.1),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
    ),
    backgroundColor: AppColor.backgroundColor,
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: const AppBarTheme(color: AppColor.white, elevation: 0.0),
    toggleableActiveColor: AppColor.primaryColor);
