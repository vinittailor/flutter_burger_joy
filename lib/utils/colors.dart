import 'package:flutter/material.dart';


const Color colorShade1 = Color(0xff2C62B2);
const Color colorShade2 = Color(0xff8152E7);
const Color colorShade3 = Color(0xff092248);
const Color colorPrimary = Color(0xffEF5DA8);
const Color colorSecondary  = Color(0xff88F9E4);



Map<int, Color> color = {
  50: const Color.fromRGBO(239, 93, 168, .1),
  100: const Color.fromRGBO(239, 93, 168, .2),
  200: const Color.fromRGBO(239, 93, 168, .3),
  300: const Color.fromRGBO(239, 93, 168, .4),
  400: const Color.fromRGBO(239, 93, 168, .5),
  500: const Color.fromRGBO(239, 93, 168, .6),
  600: const Color.fromRGBO(239, 93, 168, 0.7),
  700: const Color.fromRGBO(239, 93, 168, .8),
  2090: const Color.fromRGBO(239, 93, 168, .9),
  900: const Color.fromRGBO(239, 93, 168, 1),
};

MaterialColor colorCustom = MaterialColor(0xffEF5DA8, color);
