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
import 'package:bora_caminhar/services/just_audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

final JustAudioService _justAudioService = JustAudioService();

class AudioSelectionModal extends StatefulWidget {
  const AudioSelectionModal({super.key, required this.bloc});
  final MeditationBloc bloc;

  @override
  State<AudioSelectionModal> createState() => _AudioSelectionModalState();
}

class _AudioSelectionModalState extends State<AudioSelectionModal> {
  AudioOptions? currentSelectedAudio;

  String language = "pt-br";

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
    return StreamBuilder<MeditationState>(
        stream: widget.bloc.outputController,
        builder: (context, state) {
          if (state is LoadingState) {
            return const CircularProgressIndicator();
          }
          final audios = state.data?.audioModels ?? [];
          final audioSelected = state.data?.audioSelected;
          final audioPlaying = state.data?.audioPlaying;
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
                          currentSelectedAudioIndex: audioSelected,
                          currentPlayingAudio: audioPlaying,
                          onChanged: (index) {
                            widget.bloc.inputController
                                .add(SelectAudio(audioIndex: index));
                          },
                        )
                      ],
                      NoAudioWidget(
                        currentSelectedAudio: audioSelected,
                        onChanged: (index) {
                          widget.bloc.inputController
                              .add(SelectAudio(audioIndex: index));
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
