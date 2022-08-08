import 'package:flutter/material.dart';

const logo = <String>[
  "usa.png",
  "euro.png",
  "russia.jpg",
  "england.png",
];

ThemeData darkThemeData(BuildContext context){
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff090707),
    primaryColor: Colors.black,
    cardColor: const Color(0x0fffffff),
    selectedRowColor: const Color(0xffffffff),
    disabledColor:const Color(0x94ffffff),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Color(0xFFFFFFFF)),
    ),
  );
}

ThemeData themeData(BuildContext context){
  return ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFDF5F5F3),
    cardColor: const Color(0xffffffff),
    selectedRowColor: const Color(0xff050505),
    disabledColor: const Color(0xffacabab),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Color(0xFF070707)),
    ),
  );
}