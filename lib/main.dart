import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:jaga_makan/data/constant.dart';
import 'package:jaga_makan/screen/home_screen.dart';
import 'package:jaga_makan/screen/food_menu.dart';
import 'package:jaga_makan/screen/about.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: Constants.appName,
      theme: Constants.mainTheme,
      // darkTheme: Constants.lightTheme,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  final List<Widget> screenList = [
    Classification(),
    FoodMenu(),
    AboutPage(),
  ];

  final List navbarItem = [
    {'icon': LineIcons.home, 'text': 'Home'},
    {'icon': LineIcons.listOl, 'text': 'Food List'},
    {'icon': LineIcons.infoCircle, 'text': 'About'},
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.black.withOpacity(0.4), // status bar color
      statusBarBrightness: Brightness.dark, //status bar brigtness
      statusBarIconBrightness: Brightness.light, //status barIcon Brightness
      systemNavigationBarDividerColor:
          Colors.transparent, //Navigation bar divider color
      systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
        extendBody: true,
        body: screenList.elementAt(_index),

        //navbar
        bottomNavigationBar: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.02),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: Constants.circle50),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02,
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: GNav(
                  rippleColor: Colors.grey[300], //dot
                  hoverColor: Colors.grey[100], //nahan
                  gap: 8,
                  activeColor: Colors.black, //icon aktif
                  // iconSize: 20,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08,
                      vertical: MediaQuery.of(context).size.height * 0.016),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.white, //bg aktif
                  color: Colors.white, //icon ga aktif
                  tabs: [
                    for (var items in navbarItem)
                      GButton(
                        icon: items['icon'],
                        text: items['text'],
                      ),
                  ],
                  selectedIndex: _index,
                  onTabChange: (idx) {
                    setState(() {
                      _index = idx;
                    });
                  },
                ),
              ),
            )));
  }
}
