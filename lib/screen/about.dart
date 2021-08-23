import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:jaga_makan/data/food_data.dart';

import 'package:package_info/package_info.dart';

import 'package:jaga_makan/data/constant.dart';
import 'package:jaga_makan/data/fonts.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  List foodName1 = [];
  List foodName2 = [];

  void initState() {
    super.initState();
    _initPackageInfo();
    getFood();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  final List<dynamic> members = <dynamic>[
    {'photo': 'assets/images/mentor.jpg', 'role': 'Mentor'},
    {'photo': 'assets/images/member-1.jpg', 'role': 'App Dev'},
    {'photo': 'assets/images/member-2.jpg', 'role': 'Dataset'},
    {'photo': 'assets/images/member-3.jpg', 'role': 'ML Dev'},
  ];

  void getFood() {
    for (int i = 0; i < foodListed.length; i++) {
      FoodList fl = foodListed[i];
      if (i < 5)
        foodName1.add(fl.name);
      else
        foodName2.add(fl.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          Container(
              height: height * 1,
              width: width * 1,
              child:
                  Image.asset('assets/images/marble.jpg', fit: BoxFit.cover)),
          Container(color: Colors.white.withOpacity(0.5)),

          //AppBar
          Positioned(
              top: 0,
              left: 0,
              child: Stack(children: [
                Container(
                    height: height * 0.2,
                    width: width * 1,
                    decoration: BoxDecoration(
                      color: Constants.darkPrimary,
                      borderRadius: Constants.bottomLeft100,
                    ),
                    child: ClipRRect(
                      borderRadius: Constants.bottomLeft100,
                      child: Image.asset(
                        Images.foodBanner,
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  height: height * 0.2,
                  width: width * 1,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: Constants.bottomLeft100),
                ),
              ])),

          //Logo
          Positioned(
              top: height * 0.1,
              left: width * 0.6,
              child: SizedBox(
                  height: height * 0.2,
                  width: width * 0.4,
                  child: Container(
                      // color: Colors.yellow,
                      child: SvgPicture.asset(Images.appLogo)))),

          //Konten
          Positioned(
              top: height * 0.2,
              left: 0,
              child: Container(
                  height: height * 0.8,
                  width: width * 1,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 25),
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //App
                          Text('Jaga Makan', style: Fonts.h5),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text('Version ${_packageInfo.version}',
                                  style: Fonts.h1Light),
                              Spacer(),
                              Text('Build ${_packageInfo.buildNumber}',
                                  style: Fonts.h1Light),
                            ],
                          ),
                          Constants.singleSpace,
                          Text('Pre-trained Model: EfficienNet-B0',
                              style: Fonts.h1Light),
                          Constants.singleSpace,

                          //App Intro
                          Text(
                              'Jaga Makan is an image detection app that can recognize images and provide nutritional information about food.',
                              style: Fonts.h1Bold,
                              textAlign: TextAlign.justify),
                          Constants.singleSpace,

                          //Food List
                          Text('Foods available in this app',
                              style: Fonts.h1Bold),
                          Constants.singleSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var food in foodName1)
                                      Text(food, style: Fonts.h1Light),
                                  ]),
                              SizedBox(width: 50),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var food in foodName2)
                                      Text(food, style: Fonts.h1Light),
                                  ]),
                            ],
                          ),
                          Constants.singleSpace,

                          //Team
                          Text('Meet Our Team', style: Fonts.h1Bold),
                          Constants.singleSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var member in members)
                                Column(
                                  children: [
                                    Container(
                                      height: height / 11,
                                      width: width / 5.5,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(300.0)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(300.0),
                                          child: Image.asset(member['photo'],
                                              fit: BoxFit.cover)),
                                    ),
                                    Constants.singleSpace,
                                    Text(member['role'], style: Fonts.h1Light)
                                  ],
                                ),
                              //
                            ],
                          ),
                          Constants.singleSpace,

                          //References
                          Text('References', style: Fonts.h1Bold),
                          Constants.singleSpace,
                          Text(
                              'Food Nutrition obtained from FatSecret Indonesia',
                              style: Fonts.h1Light)
                        ],
                      )))))
        ],
      ),
    );
  }
}
