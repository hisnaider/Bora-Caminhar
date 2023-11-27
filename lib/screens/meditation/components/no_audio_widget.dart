import 'package:bora_caminhar/screens/meditation/components/audio_container.dart';
import 'package:bora_caminhar/screens/meditation/contants.dart';
import 'package:flutter/material.dart';

class NoAudioWidget extends StatelessWidget {
  const NoAudioWidget({
    super.key,
    required this.currentSelectedAudio,
    required this.onChanged,
  });
  final int? currentSelectedAudio;
  final Function(int?) onChanged;

  @override
  Widget build(BuildContext context) {
    return AudioContainer(
        currentSelectedAudio: currentSelectedAudio,
        radioValue: null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              MeditationConstants.selectNoAudio["pt-br"]!,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Radio<int?>(
              value: null,
              groupValue: currentSelectedAudio,
              onChanged: onChanged,
            )
          ],
        ));
  }
}
