import 'package:bora_caminhar/components/primary_button.dart';
import 'package:bora_caminhar/constants/constant.dart';
import 'package:bora_caminhar/screens/health/views/weight_modal.dart';
import 'package:flutter/material.dart';

class WeightInfo extends StatelessWidget {
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
  const WeightInfo(
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
            textStyle: TextStyle(
                fontFamily: "Roboto",
                color: Theme.of(context).colorScheme.background,
                fontWeight: FontWeight.w600),
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
