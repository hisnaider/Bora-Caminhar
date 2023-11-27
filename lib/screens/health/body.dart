import 'package:bora_caminhar/constants/constant.dart';
import 'package:bora_caminhar/screens/health/components/bmi.dart';
import 'package:bora_caminhar/screens/health/components/health_detail.dart';
import 'package:bora_caminhar/screens/health/components/person_information.dart';
import 'package:bora_caminhar/screens/health/components/weight_info.dart';
import 'package:bora_caminhar/util/util.dart';
import 'package:flutter/material.dart';

class HealthBody extends StatelessWidget {
  const HealthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Saúde",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 12,
        ),
        Wrap(
          runSpacing: 10,
          runAlignment: WrapAlignment.spaceBetween,
          clipBehavior: Clip.hardEdge,
          children: [
            HealthDetail(
                info: healthDetail["calorie"], total: 1000, average: 195),
            HealthDetail(
                info: healthDetail["distance"], total: 1000, average: 3.1),
            HealthDetail(
                info: healthDetail["step"], total: 10000, average: 4000),
            HealthDetail(info: healthDetail["time"], total: 1440, average: 45)
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          "Mais informações",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 12,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PersonInformation(
                gender: "Masculino",
                age: 25,
                height: 1.7,
              ),
              SizedBox(width: 10),
              WeightInfo(
                lastWeight: 75.0,
                currentWeight: 70.0,
              ),
              SizedBox(width: 10),
              BMI(
                bmiInfo: bmiCalculate(weight: 71.3, height: 1.7),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
