import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaga_makan/data/constant.dart';
import 'package:jaga_makan/data/fonts.dart';
import 'package:jaga_makan/data/food_data.dart';

class FoodDetails extends StatefulWidget {
  final FoodList nd;

  FoodDetails({Key key, this.nd}) : super(key: key);

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  FoodList nd;

  String name, serving;
  String calorie, cholestrol, sodium, pottasium;
  String fat, protein, carb;
  String image;

  void initState() {
    super.initState();
    nd = widget.nd;
    name = nd.name;
    serving = nd.serving;
    calorie = nd.calorie.toString() + ' kcal';
    fat = nd.fat.toString() + ' g';
    cholestrol = nd.cholestrol.toString() + ' mg';
    protein = nd.protein.toString() + ' mg';
    carb = nd.carb.toString() + ' g';
    sodium = nd.sodium.toString() + ' mg';
    pottasium = nd.pottasium.toString() + ' mg';
    image = nd.image;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List nutritionList = [
      {'type': 'Calorie', 'value': calorie, 'icon': Images.calorieIcon},
      {'type': 'Fat', 'value': fat, 'icon': Images.fatIcon},
      {
        'type': 'Cholestrol',
        'value': cholestrol,
        'icon': Images.cholestrolIcon
      },
      {'type': 'Protein', 'value': protein, 'icon': Images.proteinIcon},
      {'type': 'Carbohydrate', 'value': carb, 'icon': Images.carbIcon},
      {'type': 'Sodium', 'value': sodium, 'icon': Images.mineralIcon},
      {'type': 'Pottasium', 'value': pottasium, 'icon': Images.mineralIcon},
    ];

    return Scaffold(
      body: Column(
        children: [
          //Image
          Container(
              height: height * 0.5,
              width: width * 1,
              decoration: BoxDecoration(
                  borderRadius: Constants.bottomRight120,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, -5.0),
                        blurRadius: 15.0)
                  ]),
              child: ClipRRect(
                borderRadius: Constants.bottomRight120,
                child: Image.asset(image, fit: BoxFit.cover),
              )),

          //Food Name
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
            child: Container(
                width: width * 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nd.name, style: Fonts.h4),
                      Constants.singleSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Serving size', style: Fonts.h2Bold),
                          Text('1 serving ($serving)', style: Fonts.h2Bold)
                        ],
                      ),
                    ])),
          ),

          //Food Value
          Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
              child: Container(
                height: height * 0.38,
                child: ListView(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    children: [
                      for (var nutri in nutritionList)
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: Constants.nutriBox,
                          child: ListTile(
                              leading: SizedBox(
                                height: height * 0.05,
                                width: width * 0.1,
                                child: SvgPicture.asset(nutri['icon'],
                                    fit: BoxFit.cover),
                              ),
                              title: Text(nutri['type'], style: Fonts.h2Bold),
                              trailing: Text(nutri['value'], style: Fonts.h2)),
                        ),
                    ]),
              )),
        ],
      ),
    );
  }
}
