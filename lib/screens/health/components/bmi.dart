import 'package:bora_caminhar/constants/constant.dart';
import 'package:flutter/material.dart';

class BMI extends StatelessWidget {
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
  const BMI({super.key, required this.bmiInfo});
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
