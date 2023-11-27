import 'package:bora_caminhar/models/audio_model.dart';

abstract class MeditationState {
  final List<AudioModel> audioModels;
  final int? audioSelected;
  final int? audioPlaying;
  final bool loading;
  final bool repeating;
  MeditationState(
      {this.audioModels = const [],
      this.audioPlaying,
      this.audioSelected,
      this.loading = true,
      this.repeating = false});
}

class InitialState extends MeditationState {
  InitialState({required List<AudioModel> audioModels})
      : super(
            audioModels: audioModels,
            audioPlaying: null,
            audioSelected: null,
            loading: true,
            repeating: false);
}

class LoadingState extends MeditationState {
  LoadingState() : super(loading: true);
}

class LoadedState extends MeditationState {
  LoadedState({required List<AudioModel> audioModels})
      : super(audioModels: audioModels, loading: false);
}

class AudioSelectedState extends MeditationState {
  AudioSelectedState({required int? audioSelected})
      : super(audioSelected: audioSelected);
}

class AudioPlayingState extends MeditationState {
  AudioPlayingState({required int? audioPlaying})
      : super(audioPlaying: audioPlaying);
}

class AudioRepeatingState extends MeditationState {
  AudioRepeatingState({required bool repeating}) : super(repeating: repeating);
}

class AudioAddedState extends MeditationState {
  AudioAddedState({required List<AudioModel> audioModels})
      : super(audioModels: audioModels);
}
