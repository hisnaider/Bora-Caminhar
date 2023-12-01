import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MeditationStartBody extends StatelessWidget {
  const MeditationStartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _CircleWidget(),
      ],
    );
  }
}

class _CircleWidget extends StatefulWidget {
  const _CircleWidget({
    super.key,
  });

  @override
  State<_CircleWidget> createState() => __CircleWidgetState();
}

class __CircleWidgetState extends State<_CircleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _growth;
  double blurRadius = 0;
  double spreadRadius = 0;
  Timer? delay;

  @override
  void initState() {
    delay = Timer(const Duration(seconds: 0), () {
      _controller = AnimationController(
          vsync: this,
          duration: const Duration(seconds: 4),
          reverseDuration: const Duration(seconds: 4))
        ..forward();
      _growth = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeIn),
      )
        ..addListener(() {
          setState(() {
            blurRadius = 50 * _growth.value;
            spreadRadius = 50 * _growth.value;
          });
        })
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    delay!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(360),
            boxShadow: [
              BoxShadow(
                blurRadius: blurRadius + 50,
                spreadRadius: spreadRadius,
                color: Theme.of(context).colorScheme.primary,
              ),
            ]),
        child: SvgPicture.asset("assets/svg/icons/meditation.svg"),
      ),
    );
  }
}
