import 'package:bora_caminhar/models/audio_model.dart';

int? selectAudioFunction(int? index) {
  return index;
}

int? playAudioFunction(int? index) {
  return index;
}

List<AudioModel> getAudiofiles() {
  //TODO: Pegar audios do banco de dados local

  return [
    AudioModel(
      location: "assets/audios/angelical-pad.mp3",
      artist: "Lucadialessandro",
      name: "Angelical Pad",
      type: "asset",
    ),
    AudioModel(
      location: "assets/audios/leap-motiv.mp3",
      artist: "SamuelFrancisJohnson",
      name: "Leap Motiv",
      type: "asset",
    ),
    AudioModel(
      location: "assets/audios/uplifting-pad-texture.mp3",
      artist: "SamuelFrancisJohnson",
      name: "Uplifting Pad Texture",
      type: "asset",
    ),
    AudioModel(
      location: "assets/audios/light-rain-ambient.mp3",
      artist: "SoundsForYou",
      name: "Light Rain Ambient",
      type: "asset",
    ),
    AudioModel(
      location: "assets/audios/soft-rain-ambient.mp3",
      artist: "SoundsForYou",
      name: "Soft Rain Ambient",
      type: "asset",
    ),
    AudioModel(
      location:
          "assets/audios/evening-birds-singing-in-spring-background-sounds-of-nature.mp3",
      artist: "White_Records",
      name: "Evening birds singing in spring. Background sounds of nature",
      type: "asset",
    ),
    AudioModel(
      location: "assets/audios/wandering.mp3",
      artist: "Pixabay",
      name: "Wandering",
      type: "asset",
    ),
  ];
}
