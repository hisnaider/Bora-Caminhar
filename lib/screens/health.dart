import 'dart:ffi';

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Wrap(
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
          )
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
  /// especif detail
  ///
  /// It has 3 parameters:
  /// - [info]: Map that contains informations about the detail
  ///   - `title`: Title of the detail
  ///   - `unit`: Unit of the detail, ex: km, kcal, minutes, etc
  ///   - `svg`: Svg icon location
  ///   - `color`: Color of the svg icon
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
          SizedBox(
            width: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info["title"]!,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
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
        ],
      ),
    );
  }
}
