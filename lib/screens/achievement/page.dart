import 'package:bora_caminhar/screens/achievement/body.dart';
import 'package:flutter/material.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: AchievementBody(),
    );
  }
}
