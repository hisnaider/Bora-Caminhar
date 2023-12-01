import 'package:bora_caminhar/models/audio_model.dart';

abstract class MeditationState {
  final List<AudioModel> audioModels;
  final int time;
  final int? audioSelected;
  final int? audioPlaying;
  MeditationState({
    required this.audioModels,
    required this.time,
    this.audioPlaying,
    this.audioSelected,
  });
}

class InitialState extends MeditationState {
  InitialState() : super(audioModels: [], time: 1);
}

class GettedState extends MeditationState {
  GettedState({required List<AudioModel> audioModels})
      : super(
            audioModels: audioModels,
            audioPlaying: null,
            audioSelected: null,
            time: 1);
}

class ChangedState extends MeditationState {
  ChangedState(
      {required List<AudioModel> audioModels,
      required int? audioSelected,
      required int? audioPlaying,
      required int time})
      : super(
            audioModels: audioModels,
            audioPlaying: audioPlaying,
            audioSelected: audioSelected,
            time: time);
}
