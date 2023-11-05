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
            primary: Color.fromRGBO(0, 255, 194, 1),
            background: Color.fromRGBO(26, 29, 38, 1),
            surface: Color.fromRGBO(20, 23, 31, 1)),
        bottomSheetTheme: BottomSheetThemeData(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.black.withOpacity(0.8),
          modalElevation: 5,
        ),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontFamily: "Roboto",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.5),
          ),
          titleLarge: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: TextStyle(
            fontFamily: "Roboto",
            fontSize: 16,
          ),
          labelLarge: TextStyle(
            fontFamily: "Roboto",
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
