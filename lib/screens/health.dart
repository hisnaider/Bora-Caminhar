import 'dart:ffi';

import 'package:bora_caminhar/components/primary_button.dart';
import 'package:bora_caminhar/constant.dart';
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
          const Wrap(
            spacing: 10,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            children: [
              _PersonInformation(gender: "Masculino", age: 25, height: 1.7),
              _WeightInfo(
                lastWeight: 75.0,
                currentWeight: 70.0,
              ),
            ],
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "$average ${info["unit"]!} (média)",
                  style: Theme.of(context).textTheme.bodySmall,
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
    return SizedBox(
      width: 110,
      height: 113,
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
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            "$age Anos",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            "$height metros",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          PrimaryButton(
              title: "Mudar info",
              icon: Icons.boy_rounded,
              centralizeTitle: false,
              padding: EdgeInsets.zero,
              onPressed: () {})
        ],
      ),
    );
  }
}

class _WeightInfo extends StatelessWidget {
  /// This widget represents person's weigh informations, informations such as last
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
    return SizedBox(
      width: 110,
      height: 113,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Atual: ",
                    style: Theme.of(context).textTheme.bodySmall,
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
            ],
          ),
          PrimaryButton(
              title: "Medi peso",
              icon: Icons.monitor_weight,
              centralizeTitle: false,
              padding: EdgeInsets.zero,
              onPressed: () {})
        ],
      ),
    );
  }
}
