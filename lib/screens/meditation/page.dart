import 'package:bora_caminhar/screens/meditation/body.dart';
import 'package:flutter/material.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: MeditationBody(),
    );
  }
}
