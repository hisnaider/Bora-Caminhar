import 'package:bora_caminhar/screens/health/body.dart';
import 'package:flutter/material.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: HealthBody(),
    );
  }
}
