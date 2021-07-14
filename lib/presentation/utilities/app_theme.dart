import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  get lightTheme => ThemeData(
        primarySwatch: AppColor.materialPrimarySwatchColor,
        primaryColor: AppColor.primarySwatchColor,
        backgroundColor: AppColor.backgroundColorLight,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black, fontSize: 12),
          subtitle1: TextStyle(
            color: Color.fromRGBO(86, 86, 86, 1),
          ),
        ),
        brightness: Brightness.light,
        dialogBackgroundColor: Colors.grey[200],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.primarySwatchColor,
          unselectedItemColor: AppColor.appGreyColor,
          elevation: 10,
          showUnselectedLabels: true,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.white,
        ),
        primaryColorLight: Colors.white,
        radioTheme: RadioThemeData(
          splashRadius: 0,
        ),
        dataTableTheme: DataTableThemeData(
          decoration: BoxDecoration(),
        ),
      );

  get darkTheme => ThemeData(
        primarySwatch: AppColor.materialPrimarySwatchColor,
        primaryColor: AppColor.primarySwatchColor,
        backgroundColor: AppColor.backgroundColorDark,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.grey[200]),
        ),
        brightness: Brightness.dark,
        dialogBackgroundColor: Colors.grey[500],
        colorScheme: ColorScheme.highContrastDark(),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: AppColor.primarySwatchColor,
          unselectedItemColor: AppColor.appGreyColor,
          elevation: 10,
          showUnselectedLabels: true,
        ),
      );
}
