import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:jaga_makan/data/fonts.dart';
import 'package:jaga_makan/screen/food_details.dart';

import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';

import 'package:jaga_makan/data/constant.dart';
import 'package:jaga_makan/data/food_data.dart';

class Classification extends StatefulWidget {
  Classification({Key key}) : super(key: key);

  @override
  _ClassificationState createState() => _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  final ImagePicker _picker = ImagePicker();
  File pickedImage;
  int inference;

  List _result;
  FoodList nd;
  int _idx;
  double _conf = 0;

  String _name = '';
  bool isInit = true;

  loadModel() async {
    try {
      var resultant = await Tflite.loadModel(
        model: 'assets/tf_lite_model_v7_EffNetB0.tflite',
        labels: 'assets/label.txt',
      );

      print('Tensorflow Lite Load Status: $resultant');
    } on PlatformException {
      print('Tflite failed to load model');
    }
  }

  Future getImageFromGalleryCamera(bool isCamera) async {
    var image = await _picker.getImage(
        source: (isCamera == true) ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      pickedImage = File(image.path);
      applyModelonImage(pickedImage);
    });
  }

  applyModelonImage(File file) async {
    int startTime = new DateTime.now().millisecondsSinceEpoch;

    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 2,
        threshold: 0.1,
        imageMean: 0.0,
        imageStd: 1.5,
        asynch: true

        //Effnet
        // imageMean: 0.0,
        // imageStd: 1.5,
        // numResults: 2,
        // threshold: 0.1,

        //MobileNet
        // numResults: 2,
        // threshold: 0.1,
        // imageMean: 127.5,
        // imageStd: 127.5
        );

    setState(() {
      _result = res;
      isInit = false;

      _conf = _result[0]['confidence'] * 100.0;
      _idx = _result[0]['index'];

      nd = foodListed[_idx];
      _name = nd.name;

      print('List: $_result');
      print('Nama: $_name');
      print('Akurasi: ${_conf.toInt()}');
      print('index : $_idx');
      print('conf : $_conf');
    });

    int endTime = new DateTime.now().millisecondsSinceEpoch;
    inference = endTime - startTime;
    print("Inference took ${endTime - startTime}ms");

    if (isAccurate(_conf) == false) noDetectAlertDialog(context);
  }

  bool isAccurate(double confidence) {
    if (confidence < 60) return false;
    return true;
  }

  void noDetectAlertDialog(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Oops Sorry, Food is not detected',
              style: Fonts.h3Bold,
              textAlign: TextAlign.center,
            ),
            content: SizedBox(
                height: height * 0.2,
                child: SvgPicture.asset(Images.notFound, fit: BoxFit.cover)),
            shape: RoundedRectangleBorder(borderRadius: Constants.circle15),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK', style: Fonts.h2Bold))
            ],
          );
        });
  }

  void initState() {
    super.initState();
    loadModel().then((val) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xfff8f5fc),
                ),
                height: height * 0.6,
                child: pickedImage == null
                    ? Stack(
                        children: [
                          Positioned(
                            top: height * 0.03,
                            child: Container(
                                height: height * 0.45,
                                width: width * 1,
                                child: SvgPicture.asset(
                                  Images.womenPhoto,
                                )),
                          )
                        ],
                      )
                    : Image.file(
                        File(pickedImage.path),
                        fit: BoxFit.cover,
                      ),
              )),

          //Floating Action Button
          Positioned(
              right: 10,
              top: height * 0.33,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FloatingActionButton(
                    heroTag: 'cameraBtn',
                    onPressed: () {
                      getImageFromGalleryCamera(true);
                    },
                    child: Icon(LineIcons.camera),
                  ),
                  Constants.singleSpace,
                  FloatingActionButton(
                      heroTag: 'galleryBtn',
                      onPressed: () {
                        getImageFromGalleryCamera(false);
                      },
                      child: Icon(LineIcons.image))
                ],
              )),

          //Panel
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
                height: height * 0.5,
                width: width * 1,
                decoration: BoxDecoration(
                    borderRadius: Constants.topLeft80,
                    color: Constants.lightPrimary,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 10.0)
                    ]),
                //Konten
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: (isAccurate(_conf))
                        ? detectedPanel()
                        : undetectedPanel())),
          ),
        ],
      ),
    );
  }

  Column detectedPanel() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final List nutriBox = [
      {
        'svg': Images.calorieIcon,
        'title': 'Calories',
        'amount': nd.calorie.toString() + ' kcal'
      },
      {
        'svg': Images.carbIcon,
        'title': 'Carbs',
        'amount': nd.carb.toString() + ' g'
      },
      {
        'svg': Images.fatIcon,
        'title': 'Fats',
        'amount': nd.fat.toString() + ' g'
      },
      {
        'svg': Images.proteinIcon,
        'title': 'Proteins',
        'amount': nd.protein.toString() + 'g'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Food Name
        Text(
          nd.name,
          style: Fonts.h4,
        ),
        Constants.singleSpace,

        //Serving Text
        Text(
          'Serving ( ${nd.serving} )',
          style: Fonts.h2Bold,
        ),
        Constants.singleSpace,

        Text('Accuracy: ${_conf.toInt()}% Index: $_idx Time: ${inference}ms',
            style: Fonts.h1Light),
        Constants.singleSpace,

        //NUTRITION BOX
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          for (var n in nutriBox)
            Container(
              height: height * 0.15,
              width: width * 0.2,
              decoration: Constants.nutriBox,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: height * 0.05,
                          width: width * 0.1,
                          child: SvgPicture.asset(n['svg'])),
                      Text(n['title'], style: Fonts.h1Bold),
                      Text(n['amount'], style: Fonts.h1Light)
                    ]),
              ),
            ),
        ]),
        Constants.singleSpace,

        //Buttons
        Center(
          child: Container(
              height: height * 0.06,
              width: width * 1,
              child: OutlinedButton(
                  child: Text('Click for more details'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodDetails(nd: nd)));
                  },
                  style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Constants.lightPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))))),
        )
      ],
    );
  }

  Column undetectedPanel() {
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Photo Undetected',
          style: Fonts.h4,
        ),
        Constants.singleSpace,
        Text('Tips on taking picture :', style: Fonts.h2Bold),
        Constants.singleSpace,
        Text('1. Make sure the food is in the center of the picture.',
            style: Fonts.h2),
        Text('2. It\'s recommended to use flash when taking photos.',
            style: Fonts.h2),
        Constants.singleSpace,
        if (isInit == false && isAccurate(_conf) == false)
          SizedBox(
              height: height * 0.2, child: SvgPicture.asset(Images.notFound))
      ],
    );
  }
}
