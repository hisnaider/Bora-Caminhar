import 'package:just_audio/just_audio.dart';

class JustAudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();
  // bool _isPlaying = false;

  // JustAudioService() {
  //   _audioPlayer.playerStateStream.listen((event) {
  //     if (event.processingState == ProcessingState.completed) {
  //       _isPlaying = false;
  //     }
  //   });
  // }

  void playAssetsFile(String filename) async {
    try {
      await _audioPlayer.setAsset("assets/audios/$filename.mp3");
      await _audioPlayer.play();
    } catch (e) {}
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
