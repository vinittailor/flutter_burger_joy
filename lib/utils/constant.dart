import 'package:flutter/material.dart';
import 'package:flutter_burger_joy/utils/size_utils.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

double notchSize(BuildContext context) {
  ///this code is identify device has notch or not also notch height
  if (MediaQuery.of(context).viewPadding.top == 0) {
    return 20;
  } else {
    return MediaQuery.of(context).viewPadding.top + 10;
  }
}

Text getTextWithStyle(
    {required BuildContext context,required String text,
      required double size,
      Color color = Colors.white}) =>
    Text(
      text,
      style: GoogleFonts.andika(fontSize: getSize(context,size), color: color),
    );

Future? nextPage(context, Widget page) {
  return Get.to(page, transition: Transition.rightToLeft);
}

replacePage(context, Widget page) {
  return Get.off(page,transition: Transition.rightToLeft);
}

replaceAllPage(context, Widget page) {
  return Get.offAll(page,transition: Transition.rightToLeft);
}
