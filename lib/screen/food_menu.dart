import 'package:flutter/material.dart';
import 'package:jaga_makan/data/constant.dart';

import 'package:jaga_makan/data/fonts.dart';
import 'package:jaga_makan/data/food_data.dart';
import 'package:jaga_makan/screen/food_details.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double itemWidth = width * 0.3;
    double itemHeight = height * (0.35 / 2);

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //AppBar
        SizedBox(
          height: height * 0.2,
          width: width * 1,
          child: Stack(children: [
            Container(
              width: width * 1,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: Constants.bottomRight100),
              child: ClipRRect(
                  borderRadius: Constants.bottomRight100,
                  child: Image.asset(
                    Images.foodBanner1,
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: Constants.bottomRight100)),
          ]),
        ),

        Container(
            height: height * 0.8,
            width: width * 1,
            child: GridView.builder(
                padding: EdgeInsets.fromLTRB(
                    width * 0.05, width * 0.05, width * 0.05, height * 0.13),
                itemCount: foodListed.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: width * 0.05,
                    mainAxisSpacing: height * 0.025,
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final FoodList fl = foodListed[index];
                  return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FoodDetails(nd: fl);
                        }));
                      },
                      child: Container(
                          decoration: Constants.foodBox,
                          child: Column(
                            children: [
                              Container(
                                  height: height * 0.2,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: Constants.top15),
                                  child: ClipRRect(
                                      borderRadius: Constants.top15,
                                      child: Image.asset(fl.image,
                                          fit: BoxFit.cover))),
                              Constants.singleSpace,
                              Text(fl.name, style: Fonts.h2Bold)
                            ],
                          )));
                }))
      ],
    ));
  }
}
