import 'package:bora_caminhar/constants/constant.dart';
import 'package:bora_caminhar/screens/homepage_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
            primary: primaryColor,
            background: Color.fromRGBO(26, 29, 38, 1),
            surface: Color.fromRGBO(20, 23, 31, 1)),
        bottomSheetTheme: BottomSheetThemeData(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          modalElevation: 5,
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(0)))),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontFamily: "Roboto",
            fontSize: 15,
            height: 1.5,
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.5),
          ),
          titleLarge: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: TextStyle(
            fontFamily: "Roboto",
            fontSize: 16,
          ),
          labelLarge: TextStyle(
            fontFamily: "Roboto",
          ),
          labelMedium: TextStyle(
            fontFamily: "Roboto",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.5),
          ),
          labelSmall: TextStyle(
            fontFamily: "Roboto",
            fontSize: 10,
            color: Colors.white.withOpacity(0.25),
          ),
        ),
      ),
      home: Scaffold(body: HomePageScreen()),
    );
  }
}
