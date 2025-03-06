import 'package:clickcart/utils/constants/colors.dart';
import 'package:clickcart/utils/theme/badge_theme.dart';
import 'package:clickcart/utils/theme/bottom_navigation_theme.dart';
import 'package:clickcart/utils/theme/button_theme.dart';
import 'package:clickcart/utils/theme/card_theme.dart';
import 'package:clickcart/utils/theme/header_theme.dart';
import 'package:clickcart/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

class IKAppTheme {
  IKAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: IKColors.primary,
    scaffoldBackgroundColor: IKColors.background,
    textTheme: IKTextTheme.lightTheme,
    elevatedButtonTheme: IKButtonTheme.lightButtonTheme,
    appBarTheme: IKHeaderTheme.lightHeaderTheme,
    cardTheme: IKCardTheme.lightCardTheme,
    dividerColor: IKColors.border,
    cardColor: IKColors.card,
    bottomNavigationBarTheme: IKBottomNavigationTheme.lightBottomNavigationTheme,
    badgeTheme: IKBadgeTheme.lightBadgeTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: IKColors.primary,
    scaffoldBackgroundColor: IKColors.darkBackground,
    textTheme: IKTextTheme.darkTheme,
    elevatedButtonTheme: IKButtonTheme.lightButtonTheme,
    appBarTheme: IKHeaderTheme.darkHeaderTheme,
    cardTheme: IKCardTheme.darkCardTheme,
    dividerColor: IKColors.darkBorder,
    cardColor: IKColors.darkCard,
    bottomNavigationBarTheme: IKBottomNavigationTheme.darkBottomNavigationTheme,
    badgeTheme: IKBadgeTheme.darkBadgeTheme,
  );

}