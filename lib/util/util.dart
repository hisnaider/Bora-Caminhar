import 'package:flutter/material.dart';

/// This function is used to calculate the BMI of the user.
///
/// It uses the weight and the height of the user to calculate and return the
/// results in a Map<String, dynamic> format with value, description and index
///
/// It has 2 parameters:
/// - [weight] - Weight of the user;
/// - [height] - Height of the user;
///
/// It returns a Map<String, dynamic> with following properties:
/// - `value`: Result of BMI calculation;
/// - `description`: Description of the result;
/// - `index`: Index of the result (like a level)
Map<String, dynamic> bmiCalculate(
    {required double weight, required double height}) {
  final double bmi = weight / (height * height);
  final int index;
  final String description;
  if (bmi < 18.5) {
    index = 0;
    description = "Baixo peso";
  } else if (bmi >= 18.5) {
    index = 1;
    description = "Peso saudavel";
  } else if (bmi >= 25) {
    index = 2;
    description = "Sobre peso";
  } else if (bmi >= 30) {
    index = 3;
    description = "Obesidade";
  } else {
    index = 4;
    description = "Obesidade grave";
  }
  return {"value": bmi, "description": description, "index": index};
}
