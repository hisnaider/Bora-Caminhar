import 'dart:ui';

import 'package:bora_caminhar/components/primary_button.dart';
import 'package:bora_caminhar/constant.dart';
import 'package:flutter/material.dart';

class WeightModal extends StatelessWidget {
  /// This widget is the main widget weight modal.
  ///
  /// It displays a rounded container with a header that contains the name, a divider,
  /// the current weight, the [_WeightSlider] widget that is used to select new weight,
  /// and a [PrimaryButton] to user accepts the new weight and close the modal
  const WeightModal({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
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
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
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
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    "Peso atual: 70.0 kg",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const _WeightSlider(max: 200, min: 0),
                const SizedBox(
                  height: 24,
                ),
                PrimaryButton(
                  title: "Definir novo peso",
                  centralizeTitle: true,
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background),
                  padding: const EdgeInsets.all(10),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// This Widget displays the weight slider to user determines new weight
///
/// It consists of a rounded container with the primary background color, which
/// contains the [_NewWeightWidget] displaying the selected weight and the
/// difference from the current weight. The slider functionality is achieved
/// through a PageView.builder displaying [_Item] widgets for user interaction.
///
/// It had 3 parameters:
/// - [min]: Minimum weight to select;
/// - [max]: Maximum weight to select;

class _WeightSlider extends StatefulWidget {
  const _WeightSlider({
    super.key,
    required this.min,
    required this.max,
  });
  final int min;
  final int max;

  @override
  State<_WeightSlider> createState() => __WeightSliderState();
}

class __WeightSliderState extends State<_WeightSlider> {
  final PageController controller =
      PageController(viewportFraction: 0.25, initialPage: 3 + 25);
  double newWeight = 70;

  /// This function is used to change the weight
  ///
  /// It updates the state of the widget with the new weight and prevents the
  /// user to change the weight to a value less than `min` and bigger than  `max`.
  void _updateWeight() {
    int max = widget.max;
    int min = widget.min;
    if (controller.page! < 3) {
      controller.jumpToPage(3);
    } else if (controller.page! > max + 3) {
      controller.jumpToPage(max + 3);
    }
    double value = ((((controller.page ?? min) - 3) * 10).roundToDouble() / 10);
    setState(() {
      newWeight = value;
    });
  }

  /// This functions is called when, and only when the widget is created.
  ///
  /// It defines a listener to [_updateWeight] function.
  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(_updateWeight);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _NewWeightWidget(
            weight: newWeight,
            currentWeight: 70.0,
          ),
          SizedBox(
            height: 50,
            child: Stack(
              children: [
                PageView.builder(
                  pageSnapping: false,
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  itemBuilder: (context, rawIndex) {
                    int index = rawIndex - 3;
                    return _Item(
                      index: index >= widget.min && index <= widget.max
                          ? index
                          : null,
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 10,
                    height: 25,
                    child: CustomPaint(
                      painter: _WeightPointer(),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _NewWeightWidget extends StatelessWidget {
  /// This widget displays the new weight and the difference from the current one.
  ///
  /// It displays a text with the new weight, and a rounded container that contains
  /// [_WeightChangeIndicator] widget that indicates if theres a change or not, and
  /// the difference from the current one in kilograms
  ///
  /// It has 2 parameters:
  /// - [currentWeight]: User's current weight;
  /// - [weight]: New weight
  const _NewWeightWidget(
      {super.key, required this.weight, required this.currentWeight});
  final double currentWeight;
  final double weight;

  @override
  Widget build(BuildContext context) {
    double weightDifference =
        ((weight - currentWeight) * 10).roundToDouble() / 10;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: SizedBox.shrink()),
        Text(
          "$weight",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _WeightChangeIndicator(
                          weightDifference: weightDifference),
                      const SizedBox(width: 4),
                      Opacity(
                        opacity: 0.75,
                        child: Text("$weightDifference",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 18,
                                )),
                      ),
                      Opacity(
                        opacity: 0.25,
                        child: Text(
                          " kg",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 15),
                        ),
                      ),
                    ]),
              ),
              Expanded(child: SizedBox.shrink()),
            ],
          ),
        )
      ],
    );
  }
}

class _WeightChangeIndicator extends StatelessWidget {
  /// This widget is used to display a icon that represents if the user gain, lost,
  /// or not changed the weight.
  ///
  /// It displays a green down arrow icon if user had lost weight, a red up arrow
  /// icon if uset had gain weight, or a grey circle if user's weight no changed
  ///
  /// It has 1 parameter:
  /// - [weightDifference]: The difference between new and current weight. It's used
  /// to determines wich icon should be displayed
  ///   - equal 0: grey circle;
  ///   - less than 1: green down arrow;
  ///   - bigger than 1: red up arrow;
  const _WeightChangeIndicator({super.key, required this.weightDifference});
  final double weightDifference;

  @override
  Widget build(BuildContext context) {
    if (weightDifference == 0) {
      return const Icon(
        Icons.circle,
        color: Colors.grey,
        size: 15,
      );
    } else if (weightDifference < 0) {
      return const Icon(
        Icons.arrow_downward_rounded,
        color: goodResult,
      );
    }
    return const Icon(
      Icons.arrow_upward_rounded,
      color: badResult,
    );
  }
}

class _Item extends StatelessWidget {
  /// This widget is used as a item of the weight slider.
  ///
  /// It displays 11 thin grey containers, that indicates weight, and a text above
  /// the center thin container. The center container is where the weight is a integer
  ///
  /// It has 1 parameter:
  /// - [index]: Index of the item to display
  const _Item({super.key, this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (index != null)
          Center(
            child: Text(index.toString()),
          ),
        SizedBox(
          height: 28,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(10, (index) {
              double width = 0.5;
              double height = 10;
              if (index == 5) {
                width = 1;
                height = 18;
              }
              return Expanded(
                child: Row(
                  children: [
                    Transform.translate(
                        offset: Offset(-width / 2, 0),
                        child: Container(
                          width: width,
                          height: height,
                          color: Colors.grey,
                        )),
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}

/// This class create the arrow that indicates the new weight
///
/// It paints a up arrow with primary color by defining the points coordinates in
/// a cartesian plane.
///
/// It has 3 primary functions:
/// - [paint]: Used to paint the arrow or any other form;
/// - [trianglePointer]: It's the point coordinates to create the up arrow;
/// - [shouldRepaint]: Used to rebuild the paint if theres is a change. As there
/// will be no changes, it will return false.
class _WeightPointer extends CustomPainter {
  _WeightPointer();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = primaryColor;
    canvas.drawPath(trianglePointer(size.width, size.height), paint);
  }

  Path trianglePointer(
    double x,
    double y,
  ) {
    return Path()
      ..lineTo(x * 0.5, 0)
      ..lineTo(x * 0, y * 0.3)
      ..lineTo(x * 0.4, y * 0.3)
      ..lineTo(x * 0.4, y * 1)
      ..lineTo(x * 0.6, y * 1)
      ..lineTo(x * 0.6, y * 0.3)
      ..lineTo(x * 1, y * 0.3)
      ..lineTo(x * 0.5, 0);
  }

  @override
  bool shouldRepaint(_WeightPointer oldDelegate) {
    return false;
  }
}
