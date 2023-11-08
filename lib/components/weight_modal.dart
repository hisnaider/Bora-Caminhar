import 'dart:ui';

import 'package:bora_caminhar/constant.dart';
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
  final PageController controller =
      PageController(viewportFraction: 0.25, initialPage: 3 + 0);
  double newWeight = 0;

  void _updateWeight() {
    if (controller.page! < 3) {
      controller.jumpToPage(3);
    } else if (controller.page! > 203) {
      controller.jumpToPage(203);
    }
    double value = ((((controller.page ?? 0) - 3) * 10).roundToDouble() / 10);
    setState(() {
      newWeight = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(_updateWeight);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "$newWeight",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_downward_rounded),
                      SizedBox(width: 4),
                      Opacity(
                        opacity: 0.75,
                        child: Text("-2",
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
              )
            ],
          ),
          SizedBox(
            height: 60,
            child: Stack(
              children: [
                PageView.builder(
                  pageSnapping: false,
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  itemBuilder: (context, rawIndex) {
                    int index = rawIndex - 3;
                    return _Item(
                      index: index >= 0 && index <= 200 ? index : null,
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
    return true;
  }
}

class _Item extends StatelessWidget {
  final int? index;
  const _Item({super.key, this.index});

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
                        offset: Offset(-(width) / 2, 0),
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
