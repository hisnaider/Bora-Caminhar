import 'package:flutter/material.dart';

class IndexIndicator extends StatelessWidget {
  /// This widget represents an individual item in a custom slider.
  ///
  /// It displays index indicators and visual cues. The items can be arranged
  /// either horizontally or vertically based on the 'horizontal' parameter.
  ///
  /// Parameters:
  /// - [horizontal]: A boolean indicating if the slider should be horizontal.
  /// - [numberOfItems]: The total number of items in the slider.
  const IndexIndicator(
      {super.key, required this.horizontal, required this.numberOfItems});
  final bool horizontal;
  final int numberOfItems;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: horizontal ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment:
          horizontal ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: List.generate(numberOfItems, (index) {
        double x = 0.5;
        double y = 10;
        if (index == numberOfItems / 2) {
          x = 1;
          y = 18;
        }
        return Expanded(
          child: horizontal
              ? Row(
                  children: [
                    Transform.translate(
                      offset: Offset(-x / 2, 0),
                      child: Container(
                        width: x,
                        height: y,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    Transform.translate(
                      offset: Offset(0, -x / 2),
                      child: Container(
                        width: y,
                        height: x,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
