import 'package:bora_caminhar/class/global_state_manager.dart';
import 'package:bora_caminhar/components/modal_container.dart';
import 'package:bora_caminhar/components/primary_button.dart';
import 'package:bora_caminhar/constants/constant.dart';
import 'package:bora_caminhar/models/audio_model.dart';
import 'package:bora_caminhar/screens/meditation/bloc/meditation_State.dart';
import 'package:bora_caminhar/screens/meditation/bloc/meditation_bloc.dart';
import 'package:bora_caminhar/screens/meditation/bloc/meditation_event.dart';
import 'package:bora_caminhar/screens/meditation/components/asset_audio_widget.dart';
import 'package:bora_caminhar/screens/meditation/components/audio_container.dart';
import 'package:bora_caminhar/screens/meditation/components/no_audio_widget.dart';
import 'package:bora_caminhar/screens/meditation/contants.dart';
import 'package:bora_caminhar/screens/meditation/functions/audio_functions.dart';
import 'package:bora_caminhar/services/just_audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class AudioSelectionModal extends StatefulWidget {
  const AudioSelectionModal({super.key, required this.bloc});
  final MeditationBloc bloc;
  @override
  State<AudioSelectionModal> createState() => _AudioSelectionModalState();
}

class _AudioSelectionModalState extends State<AudioSelectionModal> {
  final JustAudioService _justAudioService = JustAudioService();
  AudioOptions? currentSelectedAudio;

  String language = "pt-br";

  @override
  void initState() {
    _justAudioService.audioPlayer.playerStateStream.listen((event) {
      if (event.processingState == ProcessingState.completed) {
        _justAudioService.stop();
        widget.bloc.add(PlayAudio(index: null));
      }
    });
    print(widget.bloc.audioModelsList);
    super.initState();
  }

  @override
  void dispose() {
    widget.bloc.add(PlayAudio(index: null));
    _justAudioService.dispose();
    super.dispose();
  }

  void play(int? index, String location) {
    if (index == widget.bloc.playingIndex) {
      _justAudioService.stop();
      index = null;
    } else {
      _justAudioService.playAssetsFile(location);
    }
    widget.bloc.add(PlayAudio(index: index));
  }

  @override
  Widget build(BuildContext context) {
    print(widget.bloc.audioModelsList);
    String language = "pt-br";

    return BlocBuilder<MeditationBloc, MeditationState>(
        bloc: widget.bloc,
        builder: (context, state) {
          if (state is InitialState) {
            return const CircularProgressIndicator();
          }
          final audios = state.audioModels;
          final audioSelected = state.audioSelected;
          final audioPlaying = state.audioPlaying;
          return ModalContainer(
            title: MeditationConstants.selectAudio[language]!,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < audios.length; i++) ...[
                        AssetAudioWidget(
                          index: i,
                          audioModel: audios[i],
                          currentSelectedAudio: audioSelected,
                          currentPlayingAudio: audioPlaying,
                          onChanged: (index) {
                            widget.bloc.add(SelectAudio(index: index));
                          },
                          play: play,
                        )
                      ],
                      NoAudioWidget(
                        currentSelectedAudio: audioSelected,
                        onChanged: (index) {
                          widget.bloc.add(SelectAudio(index: index));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              PrimaryButton(
                  title: selectText[language]!,
                  centralizeTitle: true,
                  padding: const EdgeInsets.all(10),
                  onPressed: () {})
            ],
          );
        });
  }
}
