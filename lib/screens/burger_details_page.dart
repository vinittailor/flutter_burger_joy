import 'package:flutter/material.dart';
import 'package:flutter_burger_joy/screens/order_confirmation_page.dart';
import 'package:flutter_burger_joy/utils/colors.dart';
import 'package:flutter_burger_joy/utils/constant.dart';
import 'package:flutter_burger_joy/utils/size_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class BurgerDetailsPage extends StatefulWidget {
  const BurgerDetailsPage({super.key});

  @override
  State<BurgerDetailsPage> createState() => _BurgerDetailsPageState();
}

class _BurgerDetailsPageState extends State<BurgerDetailsPage> with TickerProviderStateMixin  {
  int currentQuantity = 1;
  double pricePerUnit = 18.00;
  double totalPrice = 18.00;
  late AnimationController _animationController;
  double _offsetX = 0.0; // Current horizontal offset of the image
  double _offsetY = 0.0; // Current vertical offset of the image

  // Customize these values to adjust the animation:
  final double _maxOffsetX = 50.0; // Maximum horizontal offset
  final double _maxOffsetY = 30.0; // Maximum vertical offset

  late final Animation<double> _easeInSineAnimation ;

  @override
  void incrementQuantity(){
    setState(() {
      currentQuantity = currentQuantity + 1;
      updateTotalPrice();
    });
  }
  void decrementQuantity(){
    if(currentQuantity > 1){
      setState(() {
        currentQuantity = currentQuantity - 1;
        updateTotalPrice();
      });
    }

  }
  void updateTotalPrice() {
    totalPrice = pricePerUnit * currentQuantity;
  }


  void initFun() {
    _easeInSineAnimation=  Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInSine));

  }

  void initState()  {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    initFun();// Set up repeating animation
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
              0.0,
              0.1,
              0.5
            ])),
        padding: EdgeInsets.only(
            left: getSize(20),
            right: getSize(20),
            top: notchSize(context),
            bottom: getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerWidget(),
            SizedBox(
              height: getSize(20),
            ),
        SizedBox(
          height: getSize(400),
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (_, child) => Stack(
              children: [
                AnimatedPositioned(
                  right: _easeInSineAnimation.value * _maxOffsetX,
                  top: _easeInSineAnimation.value * _maxOffsetY, // Vertical offset
                  duration: Duration(milliseconds: 1000),
                  child: Image.asset(
                    'assets/png/burger.png', // Replace with your image path
                    width: getSize(300),
                  ),
                ),
              ],
            ),
          ),
        ),
            // AnimatedPositioned(
            //   duration: const Duration(seconds: 1),
            //   top: 0,
            //   left: 0,
            //
            //   child: Image.asset(
            //     'assets/png/burger.png',
            //     width: getSize(300),
            //   ),
            // ),
            getTextWithStyle(text: "Fresh Beef Burger with cheese", size: 24),
            getTextWithStyle(
                text:
                    "Burger with a huge pork cutlet, pickled cucumbers, blue onions, grilled vegetables (green beans, bell peppers, carrots), oyster dressing, black cuttlefish ink bun.",
                size: 14),
            SizedBox(
              height: getSize(20),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: getSize(20), vertical: getSize(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            incrementQuantity();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              'assets/svg/add.svg',
                              width: getSize(20),
                              color: Colors.black,
                            ),
                          ),
                        ),
                        getTextWithStyle(text: currentQuantity.toString(), size: getSize(20)),
                        GestureDetector(
                          onTap: (){
                            decrementQuantity();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              'assets/svg/dash.svg',
                              width: getSize(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getTextWithStyle(
                            text: "Total price", size: getSize(12)),
                        getTextWithStyle(text: "\$$totalPrice", size: getSize(24)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getSize(20),
            ),
            const Spacer(),
            addToCartButtonWidget(),
          ],
        ),
      ),
    );
  }


  GestureDetector addToCartButtonWidget() {
    return GestureDetector(
      onTap: () {
        nextPage(context, const OrderConfirmPage());
      },
      child: Container(
        decoration: const BoxDecoration(
          color: colorPrimary,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: getSize(20), vertical: getSize(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/basket.svg',
              width: getSize(20),
            ),
            SizedBox(
              width: getSize(20),
            ),
            getTextWithStyle(text: "Add to cart", size: getSize(16)),
          ],
        ),
      ),
    );
  }

  Row headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            'assets/svg/back.svg',
            width: getSize(20),
          ),
        ),
        SvgPicture.asset(
          'assets/svg/more.svg',
          width: getSize(20),
        ),
      ],
    );
  }
}
