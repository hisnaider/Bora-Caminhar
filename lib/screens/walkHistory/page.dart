import 'package:bora_caminhar/screens/walkHistory/body.dart';
import 'package:flutter/material.dart';

class WalkHistoryPage extends StatelessWidget {
  const WalkHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: WalkHistoryBody(),
    );
  }
}
