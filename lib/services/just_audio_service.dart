import 'package:just_audio/just_audio.dart';

class JustAudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentPlayingAudio;

  JustAudioService() {
    _audioPlayer.setVolume(1);
  }

  get currentPlayingAudio {
    return _currentPlayingAudio;
  }

  get audioPlayer {
    return _audioPlayer;
  }

  void playAssetsFile(String location) async {
    try {
      await _audioPlayer.setAsset(location);
      await _audioPlayer.play();
    } catch (e) {}
  }

  void stop() async {
    _currentPlayingAudio = null;
    await _audioPlayer.stop();
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
