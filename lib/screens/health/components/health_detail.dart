import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HealthDetail extends StatelessWidget {
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
  const HealthDetail({
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
