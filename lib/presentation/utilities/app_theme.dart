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
        // checkboxTheme: CheckboxThemeData(
        //   side: BorderSide(width: 0.8),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(4),
        //   )
        // ),
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
        radioTheme: RadioThemeData(
          splashRadius: 0,
        ),
        cardColor: AppColor.headerBackgroundColor,
        dataTableTheme: DataTableThemeData(
          decoration: BoxDecoration(),
        ),
      );

  static get darkTheme => ThemeData(
        primarySwatch: AppColor.materialPrimarySwatchColor,
        primaryColor: AppColor.primarySwatchColor,
        backgroundColor: AppColor.backgroundColorDark,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white, fontSize: 12),
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
