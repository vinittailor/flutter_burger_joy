import 'package:flutter/material.dart';
import 'package:flutter_burger_joy/utils/colors.dart';
import 'package:flutter_burger_joy/utils/constant.dart';
import 'package:flutter_burger_joy/utils/size_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderConfirmPage extends StatefulWidget {
  const OrderConfirmPage({super.key});

  @override
  State<OrderConfirmPage> createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: getSize(20), vertical: getSize(10)),
              child: SvgPicture.asset('assets/svg/baseline_done_all.svg'),
            ),
            SizedBox(
              height: getSize(20),
            ),
            getTextWithStyle(text: "Done!", size: 16),
            getTextWithStyle(text: "Oder added to the cart", size: 16),
          ],
        ),
      ),
    );
  }
}
