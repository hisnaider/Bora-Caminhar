import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bora_caminhar/models/audio_model.dart';
import 'package:bora_caminhar/screens/meditation/bloc/meditation_State.dart';
import 'package:bora_caminhar/screens/meditation/bloc/meditation_event.dart';
import 'package:bora_caminhar/screens/meditation/functions/audio_functions.dart';

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  int? selectedIndex;
  int? playingIndex;
  int time = 1;
  List<AudioModel> audioModelsList = [];

  MeditationBloc() : super(InitialState()) {
    on(_mapEventToState);
  }

  void _mapEventToState(MeditationEvent event, Emitter emit) async {
    if (event is GetAudios) {
      audioModelsList = event.audioModels;
    } else if (event is SelectAudio) {
      selectedIndex = event.index;
    } else if (event is PlayAudio) {
      playingIndex = event.index;
    } else if (event is SelectTime) {
      time = event.minute;
    }
    emit(
      ChangedState(
          audioModels: audioModelsList,
          audioSelected: selectedIndex,
          audioPlaying: playingIndex,
          time: time),
    );
  }
}
