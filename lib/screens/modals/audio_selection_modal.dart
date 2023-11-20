import 'package:bora_caminhar/components/modal_container.dart';
import 'package:bora_caminhar/constants/constant.dart';
import 'package:bora_caminhar/constants/meditation_constants.dart';
import 'package:bora_caminhar/services/just_audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioSelectionModal extends StatefulWidget {
  const AudioSelectionModal({super.key});

  @override
  State<AudioSelectionModal> createState() => _AudioSelectionModalState();
}

class _AudioSelectionModalState extends State<AudioSelectionModal> {
  JustAudioService _justAudioService = JustAudioService();
  MeditationAudioList? currentSelectedAudio;

  void changeSelectedAudio(MeditationAudioList? value) {
    setState(() {
      currentSelectedAudio = value;
    });
  }

  void playAudio(String? filename) {
    setState(() {
      if (_justAudioService.currentPlayingAudio == filename) {
        _justAudioService.stop();
      } else {
        _justAudioService.playAssetsFile(filename!);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _justAudioService.audioPlayer.playerStateStream.listen((event) {
      setState(() {
        if (event.processingState == ProcessingState.completed) {
          _justAudioService.stop();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _justAudioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String language = "pt-br";
    return ModalContainer(
      title: MeditationConstants.selectAudio[language]!,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: MeditationAudioList.values.length,
            itemBuilder: (context, index) {
              return _AudioContainer(
                  meditationAudio: MeditationAudioList.values[index],
                  changeSelectedAudio: changeSelectedAudio,
                  currentSelectedAudio: currentSelectedAudio,
                  playAudio: playAudio,
                  currentPlayingAudio: _justAudioService.currentPlayingAudio);
            },
          ),
        ),
      ],
    );
  }
}

class _AudioContainer extends StatelessWidget {
  const _AudioContainer(
      {super.key,
      required this.meditationAudio,
      required this.changeSelectedAudio,
      required this.currentSelectedAudio,
      required this.playAudio,
      this.currentPlayingAudio});
  final MeditationAudioList meditationAudio;
  final MeditationAudioList? currentSelectedAudio;
  final Function(MeditationAudioList?) changeSelectedAudio;
  final Function(String?) playAudio;
  final String? currentPlayingAudio;

  @override
  Widget build(BuildContext context) {
    bool isPlaying() {
      return currentPlayingAudio == meditationAudio.fileName;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        children: [
          IconButton.filled(
            onPressed: () => playAudio(meditationAudio.fileName),
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
                  meditationAudio.name,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  meditationAudio.artist.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
          Radio<MeditationAudioList>(
            value: meditationAudio,
            groupValue: currentSelectedAudio,
            onChanged: changeSelectedAudio,
          )
        ],
      ),
    );
  }
}
