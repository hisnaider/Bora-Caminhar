import 'dart:ffi';

import 'package:bora_caminhar/screens/modals/person_info_modal.dart';
import 'package:bora_caminhar/components/primary_button.dart';
import 'package:bora_caminhar/screens/modals/weight_modal.dart';
import 'package:bora_caminhar/constants/constant.dart';
import 'package:bora_caminhar/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HealthWidget extends StatelessWidget {
  const HealthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
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
              _HealthDetail(
                  info: healthDetail["calorie"], total: 1000, average: 195),
              _HealthDetail(
                  info: healthDetail["distance"], total: 1000, average: 3.1),
              _HealthDetail(
                  info: healthDetail["step"], total: 10000, average: 4000),
              _HealthDetail(
                  info: healthDetail["time"], total: 1440, average: 45)
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
                _PersonInformation(
                  gender: "Masculino",
                  age: 25,
                  height: 1.7,
                ),
                SizedBox(width: 10),
                _WeightInfo(
                  lastWeight: 75.0,
                  currentWeight: 70.0,
                ),
                SizedBox(width: 10),
                _BMI(
                  bmiInfo: bmiCalculate(weight: 71.3, height: 1.7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HealthDetail extends StatelessWidget {
  /// This widget represents a health detail, it can be calories, walk distance,
  /// number os steps or time
  ///
  /// It contains a svg icon, a title, the total and the average number of that
  /// specific detail
  ///
  /// It has 3 parameters:
  /// - [info]: Map that contains informations about the detail
  ///   - `title`: Title of the detail
  ///   - `unit`: Unit of the detail, ex: km, kcal, minutes, etc
  ///   - `svg`: Svg icon location
  ///   - `color`: Color of the svg icon
  /// - [total]: Total number of the specific detail, ex: how many calories user
  /// has burn since the first walk
  /// - [average]: Average number of the specific detail, ex: how many calories
  /// user burns per walk
  ///
  const _HealthDetail({
    super.key,
    required this.info,
    required this.total,
    required this.average,
  });
  final Map<String, dynamic> info;
  final int total;
  final double average;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2 - 20;
    return SizedBox(
      width: width,
      child: Row(
        children: [
          SvgPicture.asset(
            info["svg"]!,
            height: 40,
            colorFilter: ColorFilter.mode(info["color"]!, BlendMode.srcIn),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info["title"]!,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "$total ${info["unit"]!}",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  "$average ${info["unit"]!} (média)",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonInformation extends StatelessWidget {
  /// This widget represents person's information, informations such as gender
  /// age and height
  ///
  /// It contains a title, 3 text with the informations and a [PrimaryButton] to open
  /// the modal to edit the informations
  ///
  /// It has 3 parameters:
  /// - [gender]: User's gender;
  /// - [age]: User's age;
  /// - [height]: User's height.
  const _PersonInformation(
      {super.key,
      required this.gender,
      required this.age,
      required this.height});
  final String gender;
  final int age;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Você",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            gender,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            "$age Anos",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            "$height metros",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          PrimaryButton(
            title: "Mudar info",
            icon: Icons.boy_rounded,
            centralizeTitle: false,
            padding: EdgeInsets.all(5),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const PersonInfoModal();
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class _WeightInfo extends StatelessWidget {
  /// This widget represents person's weight informations, informations such as last
  /// weight and current weight
  ///
  /// It contains a title, 2 text with the informations, icon indicating if the
  /// current weight is greater, equal or lower than the last weight and a [PrimaryButton]
  /// to open the modal to edit the current weight.
  ///
  /// It has 2 parameters:
  /// - [lastWeight]: User's last weight
  /// - [currentWeight]: User's current weight;
  const _WeightInfo(
      {super.key, required this.lastWeight, required this.currentWeight});
  final double lastWeight;
  final double currentWeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Peso",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "Anterior: $lastWeight",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Atual: ",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                currentWeight.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              currentWeight != lastWeight
                  ? currentWeight < lastWeight
                      ? const Icon(
                          Icons.arrow_downward_rounded,
                          color: goodResult,
                        )
                      : const Icon(
                          Icons.arrow_upward_rounded,
                          color: badResult,
                        )
                  : const SizedBox.shrink()
            ],
          ),
          PrimaryButton(
            title: "Medir peso",
            icon: Icons.monitor_weight,
            centralizeTitle: false,
            padding: const EdgeInsets.all(5),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const WeightModal();
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class _BMI extends StatelessWidget {
  /// This widget represents person's BMI informationS.
  ///
  /// It contains a title, value of BMI calculation, BMI description, and a row
  /// of all 5 BMI result (underweight, normal, overweight, obese and extremely
  /// obese)
  ///
  /// It has 1 parameter:
  /// - [bmiInfo]: A map that contains the information about the BMI result:
  ///   - `value`: Double value that is the result of BMI calculation;
  ///   - `description`: Description of BMI calculation's result;
  ///   - `index`: Integer that represents the index of BMI calculation's result
  ///   of 5 possible results.
  ///
  /// Is recommended to get the [bmiInfo] map by using [bmiCalculate] function
  /// from `util.dart`
  const _BMI({super.key, required this.bmiInfo});
  final Map<String, dynamic> bmiInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "IMC",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bmiInfo["value"].toStringAsFixed(2),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                bmiInfo["description"],
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: bmiIndexColor[bmiInfo["index"]]),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 5; i++) ...[
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 5,
                          width: 4,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                            color: i == bmiInfo["index"]
                                ? bmiIndexColor[i]
                                : Colors.transparent,
                          ),
                        ),
                        Container(
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: bmiIndexColor[i],
                          ),
                        ),
                      ],
                    ),
                  )
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
