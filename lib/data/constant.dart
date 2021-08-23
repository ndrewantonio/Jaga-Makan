import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static String appName = "Jaga Makan";

  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Colors.black;
  static Color mainRed = Color(0xffee4d34);

  static ThemeData mainTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: darkPrimary, //warna appbar
    accentColor: darkPrimary, //warna button
    scaffoldBackgroundColor: lightPrimary, //warna bg scaffold
    fontFamily: GoogleFonts.montserrat().fontFamily,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightPrimary,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconTheme: IconThemeData(
        color: lightPrimary,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: darkPrimary),
  );

  static SizedBox singleSpace = SizedBox(height: 10);
  static SizedBox doubleSpace = SizedBox(height: 20);
  static SizedBox rowSpace = SizedBox(width: 10);

  static BorderRadiusGeometry circle50 = BorderRadius.circular(50);

  static BorderRadiusGeometry circle15 = BorderRadius.circular(15);

  static BorderRadiusGeometry bottom50 = BorderRadius.only(
    bottomLeft: Radius.circular(50.0),
    bottomRight: Radius.circular(50.0),
  );

  static BorderRadiusGeometry topLeft80 = BorderRadius.only(
    topRight: Radius.circular(80.0),
  );

  static BorderRadiusGeometry bottomRight100 = BorderRadius.only(
    bottomRight: Radius.circular(100.0),
  );

  static BorderRadiusGeometry bottomRight120 = BorderRadius.only(
    bottomRight: Radius.circular(120.0),
  );

  static BorderRadiusGeometry bottomLeft100 =
      BorderRadius.only(bottomLeft: Radius.circular(100.0));

  static BoxDecoration nutriBox = BoxDecoration(
      color: Colors.grey[100].withOpacity(0.5),
      borderRadius: circle15,
      border: Border.all(color: darkPrimary.withOpacity(0.3)));

  static BoxDecoration foodBox = BoxDecoration(
      color: Colors.grey[100].withOpacity(0.5),
      borderRadius: circle15,
      border: Border.all(color: darkPrimary.withOpacity(0.3)));

  static BorderRadiusGeometry top15 = BorderRadius.only(
      topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0));
}

class Images {
  //SVG
  static String calorieIcon = 'assets/images/svg/calories.svg';
  static String carbIcon = 'assets/images/svg/carbs.svg';
  static String fatIcon = 'assets/images/svg/fat.svg';
  static String proteinIcon = 'assets/images/svg/proteins.svg';
  static String cholestrolIcon = 'assets/images/svg/cholestrol.svg';
  static String mineralIcon = 'assets/images/svg/minerals.svg';

  static String womenPhoto = 'assets/images/svg/women.svg';
  static String appLogo = 'assets/images/svg/jagamakan-logo.svg';
  static String notFound = 'assets/images/svg/404.svg';

  //JPG
  static String foodBanner = 'assets/images/food.jpg';
  static String foodBanner1 = 'assets/images/food-banner.jpg';
}
