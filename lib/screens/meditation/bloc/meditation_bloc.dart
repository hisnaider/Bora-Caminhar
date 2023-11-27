import 'dart:async';

import 'package:bora_caminhar/models/audio_model.dart';
import 'package:bora_caminhar/screens/meditation/bloc/meditation_State.dart';
import 'package:bora_caminhar/screens/meditation/bloc/meditation_event.dart';
import 'package:bora_caminhar/screens/meditation/functions/audio_functions.dart';

class MeditationBloc {
  final StreamController<MeditationEvent> _inputController =
      StreamController<MeditationEvent>();
  final StreamController<MeditationState> _outputController =
      StreamController<MeditationState>();

  Sink<MeditationEvent> get inputController => _inputController.sink;
  Stream<MeditationState> get outputController => _outputController.stream;

  MeditationBloc() {
    _inputController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(MeditationEvent event) async {
    _outputController.add(LoadingState());
    if (event is Initial) {
      List<AudioModel> audioModelsList = getAudiofiles();
      _outputController.add(InitialState(audioModels: audioModelsList));
    } else if (event is SelectAudio) {
      int? selectedAudio = selectAudioFunction(event.audioIndex);
      _outputController.add(AudioSelectedState(audioSelected: selectedAudio));
    } else if (event is PlayAudio) {
      int? playingAudio = playAudioFunction(event.audioIndex);
      _outputController.add(AudioPlayingState(audioPlaying: playingAudio));
    }
  }
}
