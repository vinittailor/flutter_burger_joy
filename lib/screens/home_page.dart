import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_burger_joy/screens/burger_details_page.dart';
import 'package:flutter_burger_joy/utils/colors.dart';
import 'package:flutter_burger_joy/utils/constant.dart';
import 'package:flutter_burger_joy/utils/size_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //region Variables
  List<Map<String, dynamic>> foodCardsList = [
    {
      'image': 'assets/png/burger_5.png',
      'title': 'Beef Burger',
      'subTitle': 'Beef with cheese',
      'price': '\$18.00',
    },
    {
      'image': 'assets/png/burger_6.png',
      'title': 'Rancho Burger',
      'subTitle': 'Beef with egg',
      'price': '\$16.00',
    },
    {
      'image': 'assets/png/burger_7.png',
      'title': 'Tehas Burger',
      'subTitle': 'Beef with tomato',
      'price': '\$12.00',
    },
    {
      'image': 'assets/png/burger_8.png',
      'title': 'Chicken Burger',
      'subTitle': 'Beef with chiken',
      'price': '\$9.00',
    },
  ];

  // double _imageHeightAndWidth = 100;
  // double _imageBgHeightAndWidth = 120;
  // double  _finalAngleInRadians = 0;

  List<double> _imageHeightAndWidth = [];
  List<double> _imageBgHeightAndWidth = [];
  List<double> _finalAngleInRadians = [];

  int selectedFoodCategory = 0;

  //endregion

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _imageHeightAndWidth = List<double>.filled(foodCardsList.length, 100);
    _imageBgHeightAndWidth = List<double>.filled(foodCardsList.length, 120);
    _finalAngleInRadians = List<double>.filled(foodCardsList.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              colorShade1,
              colorShade2,
              colorShade3,
            ],
                stops: [
              0.2,
              0.5,
              0.9
            ])),
        padding: EdgeInsets.only(
            left: getSize(20),
            right: getSize(20),
            top: notchSize(context),
            bottom: getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            headerWidget(),
            SizedBox(
              height: getSize(20),
            ),
            getTextWithStyle(text: 'Good Bites', size: 40),
            getTextWithStyle(text: 'delicious burgers!', size: 18),
            SizedBox(
              height: getSize(40),
            ),
            buildFoodCategoryTabBar(),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                runSpacing: getSize(20),
                spacing: getSize(40),
                children: List.generate(
                  foodCardsList.length,
                  (index) => GestureDetector(
                      onLongPressStart: (details) {
                        setState(() {
                          _imageHeightAndWidth[index] = 150;
                          _imageBgHeightAndWidth[index] = 0;
                          _finalAngleInRadians[index] = (10 * 3.1415927 / 180);
                        });
                      },
                      onLongPressEnd: (details) {
                        setState(() {
                          _imageHeightAndWidth[index] = 100;
                          _imageBgHeightAndWidth[index] = 120;
                          _finalAngleInRadians[index] = 0;
                        });
                      },
                      onTap: () {
                        nextPage(context, const BurgerDetailsPage());
                      },
                      child: foodCards(index)),
                ),
              ),
            ),
            SizedBox(
              height: getSize(40),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.4))
                  ]),
              padding: EdgeInsets.symmetric(
                  horizontal: getSize(20), vertical: getSize(5)),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/location.svg',
                    width: getSize(20),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: getSize(20),
                    backgroundColor: colorPrimary,
                    child: SvgPicture.asset(
                      'assets/svg/basket.svg',
                      width: getSize(20),
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/png/piggy_bank.png',
                    width: getSize(20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildFoodCategoryTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.1),
              blurStyle: BlurStyle.normal)
        ],
      ),
      padding:
          EdgeInsets.symmetric(horizontal: getSize(20), vertical: getSize(10)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                height: getSize(10),
                width: getSize(10),
              ),
              Expanded(
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedFoodCategory = 0;
                        });
                      },
                      child: getTextWithStyle(text: 'Burger', size: 14))),
              SizedBox(
                width: getSize(20),
              ),
              SizedBox(
                height: getSize(10),
                width: getSize(10),
              ),
              Expanded(
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedFoodCategory = 1;
                        });
                      },
                      child: getTextWithStyle(text: 'Pasta', size: 14))),
              SizedBox(
                width: getSize(20),
              ),
              SizedBox(
                height: getSize(10),
                width: getSize(10),
              ),
              Expanded(
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedFoodCategory = 2;
                        });
                      },
                      child: getTextWithStyle(text: 'Salads', size: 14))),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    'assets/svg/filter.svg',
                    width: getSize(20),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              selectedFoodCategory == 0
                  ? selectedOptionIndicator()
                  : SizedBox(
                      height: getSize(10),
                      width: getSize(10),
                    ),
              const Expanded(child: SizedBox()),
              SizedBox(
                width: getSize(20),
              ),
              selectedFoodCategory == 1
                  ? selectedOptionIndicator()
                  : SizedBox(
                      height: getSize(10),
                      width: getSize(10),
                    ),
              const Expanded(child: SizedBox()),
              SizedBox(
                width: getSize(20),
              ),
              selectedFoodCategory == 2
                  ? selectedOptionIndicator()
                  : SizedBox(
                      height: getSize(10),
                      width: getSize(10),
                    ),
              const Expanded(child: SizedBox()),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox foodCards(int index) {
    return SizedBox(
      width: getSize(130),
      height: getSize(200),
      child: Stack(
        // alignment: Alignment.,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    // Match controller's duration
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    height: _imageBgHeightAndWidth[index],
                    width: _imageBgHeightAndWidth[index],
                  ),
                  TweenAnimationBuilder(
                      tween: Tween<double>(
                          begin: 0, end: _finalAngleInRadians[index]),
                      duration: const Duration(milliseconds: 300),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        // Match controller's duration
                        curve: Curves.easeInOut,
                        // Animation curve for smoothness
                        width: _imageHeightAndWidth[index],
                        height: _imageHeightAndWidth[index],
                        child: Image.asset(
                          foodCardsList[index]['image'],
                        ),
                      ),
                      builder: (context, double rotationAngleInRadians, child) {
                        return Transform.rotate(
                          angle: rotationAngleInRadians,
                          child: child,
                        );
                      }),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: getSize(10),
              ),
              getTextWithStyle(text: foodCardsList[index]['title'], size: 16),
              getTextWithStyle(
                  text: foodCardsList[index]['subTitle'], size: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getTextWithStyle(
                      text: foodCardsList[index]['price'],
                      size: 14,
                      color: colorSecondary),
                  CircleAvatar(
                    radius: getSize(13),
                    backgroundColor: Colors.black.withOpacity(0.3),
                    child: SvgPicture.asset(
                      'assets/svg/add.svg',
                      // width: getSize(20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  //region Widget
  Container selectedOptionIndicator() => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: const Color(0xffE8AF3D),
    ),
    height: getSize(10),
    width: getSize(10),
  );

  Row headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/svg/menu.svg',
          width: getSize(20),
        ),
        SvgPicture.asset(
          'assets/svg/notification.svg',
          width: getSize(20),
        ),
      ],
    );
  }

//endregion
}
