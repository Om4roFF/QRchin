import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static get lightTheme => ThemeData(
        primarySwatch: AppColor.materialPrimarySwatchColor,
        primaryColor: AppColor.primarySwatchColor,
        backgroundColor: AppColor.backgroundColorLight,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: AppColor.lightMainTextColor),
          bodyText2:
              TextStyle(color: AppColor.lightMainTextColor, fontSize: 12),
          headline6: TextStyle(color: AppColor.lightMainTextColor),
          subtitle1: TextStyle(
            color: AppColor.lightMainTextColor,
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
        dividerColor: Color.fromRGBO(229, 229, 229, 1),
        appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.white,
            brightness: Brightness.light,
            titleTextStyle: TextStyle(color: AppColor.lightMainTextColor)),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.white,
        ),
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.black,
        radioTheme: RadioThemeData(
          splashRadius: 0,
        ),
        cardColor: Colors.white,
        dataTableTheme: DataTableThemeData(
          decoration: BoxDecoration(),
        ),
      );

  static get darkTheme => ThemeData(
        primarySwatch: AppColor.materialPrimarySwatchColor,
        primaryColor: AppColor.primarySwatchColorDark,
        backgroundColor: AppColor.backgroundColorDark,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.black, fontSize: 12),
          headline6: TextStyle(color: Colors.white),
          subtitle1: TextStyle(
            color: Colors.white,
          ),
        ),
        brightness: Brightness.dark,
        dialogBackgroundColor: Colors.grey[500],
        colorScheme: const ColorScheme.dark(),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: AppColor.primarySwatchColorDark,
          unselectedItemColor: AppColor.appGreyColor,
          elevation: 10,
          showUnselectedLabels: true,
        ),
        dividerColor: Color.fromRGBO(229, 229, 229, 1),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          // foregroundColor: Colors.white,
          // color: Colors.white,
          backgroundColor: AppColor.backgroundColorDark,
          brightness: Brightness.light,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: AppColor.backgroundColorDark,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.black,
        ),
        primaryColorLight: Colors.black,
        primaryColorDark: Colors.white,
        radioTheme: RadioThemeData(
          splashRadius: 0,
        ),
        cardColor: Colors.white60,
        dataTableTheme: DataTableThemeData(
          decoration: BoxDecoration(),
        ),
      );
}
