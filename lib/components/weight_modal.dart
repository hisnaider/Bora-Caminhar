import 'dart:ui';

import 'package:flutter/material.dart';

class WeightModal extends StatelessWidget {
  const WeightModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Theme.of(context).colorScheme.background,
            ),
            child: Column(
              children: [
                Text(
                  "Medir peso",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                Divider(
                  color: Colors.white.withOpacity(0.1),
                  height: 25,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Novo peso",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        "Atual: 70.0 kg",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                _WeightSlider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WeightSlider extends StatefulWidget {
  const _WeightSlider({super.key});

  @override
  State<_WeightSlider> createState() => __WeightSliderState();
}

class __WeightSliderState extends State<_WeightSlider> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2 - 10;
    return Container(
      margin: EdgeInsets.only(top: 6),
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "68",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 35,
            child: ListView.builder(
              itemCount: 1001,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index % 10 == 0) {
                  int weight = ((index / 10) + 40).toInt();
                  return Padding(
                    padding: EdgeInsets.only(
                        right: index == 1000 ? width : 2.5,
                        left: index == 0 ? width : 2.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 3,
                          height: 20,
                          child: OverflowBox(
                            alignment: Alignment.center,
                            maxWidth: 25,
                            child: Text(
                              weight.toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                        Container(
                          width: 3,
                          height: 13,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.fromLTRB(2.5, 29, 2.5, 0),
                    width: 1,
                    color: Colors.grey,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
