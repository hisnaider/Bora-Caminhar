import 'package:bora_caminhar/models/audio_model.dart';

abstract class MeditationEvent {}

class Initial extends MeditationEvent {
  Initial();
}

class SelectAudio extends MeditationEvent {
  final int? audioIndex;
  SelectAudio({required this.audioIndex});
}

class PlayAudio extends MeditationEvent {
  final int? audioIndex;
  PlayAudio({required this.audioIndex});
}

class RepeatAudio extends MeditationEvent {
  final bool repeat;
  RepeatAudio({required this.repeat});
}
