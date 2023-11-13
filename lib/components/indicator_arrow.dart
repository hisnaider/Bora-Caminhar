import 'package:bora_caminhar/constant.dart';
import 'package:flutter/material.dart';

/// This class create the arrow
///
/// It paints a right or up arrow with primary color by defining the points coordinates in
/// a cartesian plane.
///
/// It has 3 primary functions:
/// - [paint]: Used to paint the arrow or any other form;
/// - [upArrow]: It's the point coordinates to create the up arrow;
/// - [rightArrow]: It's the point coordinates to create the right arrow;
/// - [shouldRepaint]: Used to rebuild the paint if theres is a change. As there
/// will be no changes, it will return false.
class IndexArrowIndicator extends CustomPainter {
  IndexArrowIndicator({required this.renderUpArrow});
  final bool renderUpArrow;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = primaryColor;
    if (renderUpArrow) {
      canvas.drawPath(upArrow(size.width, size.height), paint);
    } else {
      canvas.drawPath(rightArrow(size.width, size.height), paint);
    }
  }

  Path upArrow(
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

  Path rightArrow(
    double x,
    double y,
  ) {
    return Path()
      ..lineTo(x, y * 0.5)
      ..lineTo(x * 0.6, 0)
      ..lineTo(x * 0.6, y * 0.4)
      ..lineTo(0, y * 0.4)
      ..lineTo(0, y * 0.6)
      ..lineTo(x * 0.6, y * 0.6)
      ..lineTo(x * 0.6, y)
      ..lineTo(x, y * 0.5);
  }

  @override
  bool shouldRepaint(IndexArrowIndicator oldDelegate) {
    return false;
  }
}
