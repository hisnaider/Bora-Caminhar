import 'package:bora_caminhar/models/audio_model.dart';
import 'package:bora_caminhar/screens/meditation/components/audio_container.dart';
import 'package:bora_caminhar/services/just_audio_service.dart';
import 'package:flutter/material.dart';

class AssetAudioWidget extends StatelessWidget {
  const AssetAudioWidget({
    super.key,
    required this.index,
    required this.currentSelectedAudio,
    required this.currentPlayingAudio,
    required this.audioModel,
    required this.onChanged,
    required this.play,
  });
  final int index;
  final int? currentSelectedAudio;
  final int? currentPlayingAudio;
  final AudioModel audioModel;
  final Function(int?) onChanged;
  final Function(int, String) play;

  @override
  Widget build(BuildContext context) {
    bool isPlaying() {
      return currentPlayingAudio == index;
    }

    return AudioContainer(
        currentSelectedAudio: currentSelectedAudio,
        radioValue: index,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton.filled(
              onPressed: () => play(index, audioModel.location),
              icon: Icon(
                isPlaying() ? Icons.pause_rounded : Icons.play_arrow_rounded,
                size: 24,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    audioModel.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    audioModel.artist.toUpperCase(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Radio<int?>(
              value: index,
              groupValue: currentSelectedAudio,
              onChanged: onChanged,
            )
          ],
        ));
  }
}
