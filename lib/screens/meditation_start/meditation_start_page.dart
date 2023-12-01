import 'package:bora_caminhar/screens/meditation/body.dart';
import 'package:bora_caminhar/screens/meditation_start/meditation_start_body.dart';
import 'package:flutter/material.dart';

class MeditationStartPage extends StatelessWidget {
  const MeditationStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: MeditationStartBody(),
    );
  }
}
