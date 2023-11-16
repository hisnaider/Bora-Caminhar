import 'package:bora_caminhar/components/index_indicator.dart';
import 'package:bora_caminhar/components/indicator_arrow.dart';
import 'package:flutter/material.dart';

class MyCustomSlider extends StatefulWidget {
  const MyCustomSlider(
      {super.key,
      required this.horizontal,
      required this.controller,
      required this.min,
      required this.max});
  final bool horizontal;
  final PageController controller;
  final int min;
  final int max;

  @override
  State<MyCustomSlider> createState() => _MyCustomSliderState();
}

class _MyCustomSliderState extends State<MyCustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget.horizontal
            ? SizedBox.shrink()
            : Row(
                children: [],
              ),
      ),
    );
  }

  Widget _buildSlider() {
    return Stack(
      children: [
        PageView.builder(
          pageSnapping: false,
          scrollDirection: widget.horizontal ? Axis.horizontal : Axis.vertical,
          controller: widget.controller,
          itemBuilder: (context, rawIndex) {
            int? index = rawIndex - 3;
            index = index >= widget.min && index <= widget.max ? index : null;
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const IndexIndicator(horizontal: false, numberOfItems: 10),
                const SizedBox(
                  height: 5,
                ),
                if (index != null)
                  Opacity(
                    opacity: 0.25,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("${(index * 0.1).toStringAsFixed(1)}"),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        Align(
          alignment:
              widget.horizontal ? Alignment.bottomCenter : Alignment.centerLeft,
          child: SizedBox(
            width: 25,
            height: 10,
            child: CustomPaint(
              painter: IndexArrowIndicator(renderUpArrow: widget.horizontal),
            ),
          ),
        ),
      ],
    );
  }
}
