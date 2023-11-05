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
