import 'package:bora_caminhar/models/audio_model.dart';

abstract class MeditationEvent {}

class Initial extends MeditationEvent {
  Initial();
}

class GetAudios extends MeditationEvent {
  final List<AudioModel> audioModels;
  GetAudios({required this.audioModels});
}

class SelectAudio extends MeditationEvent {
  final int? index;
  SelectAudio({required this.index});
}

class PlayAudio extends MeditationEvent {
  final int? index;
  PlayAudio({required this.index});
}

class SelectTime extends MeditationEvent {
  final int minute;
  SelectTime({required this.minute});
}
