import 'package:bora_caminhar/constants/constant.dart';
import 'package:bora_caminhar/screens/meditation/contants.dart';
import 'package:flutter/material.dart';

class GlobalStateManager extends ChangeNotifier {
  AudioOptions? _currentAudioOptions;

  GlobalStateManager({required currentAudioOptions}) {
    _currentAudioOptions = currentAudioOptions;
  }

  get currentAudioOptions {
    return _currentAudioOptions;
  }

  void changeAudioOptions(AudioOptions? value) {
    _currentAudioOptions = value;
  }
}
