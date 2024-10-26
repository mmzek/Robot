import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:async';

class VoiceControl {
  final SpeechToText _speechToText = SpeechToText();
  late Timer _listeningCheckTimer;
  bool _isListening = false;

  Future<void> initializeSpeechRecognition({
    required Function(String) onSpeechResult,
  }) async {
    if (await Permission.microphone.request().isGranted) {
      bool available = await _speechToText.initialize(
        onError: (error) {
          print("Speech Recognition Error: $error");
          if (!_isListening) _startListening(onSpeechResult);
        },
        onStatus: (status) {
          _isListening = status == "listening";
          print("Speech Recognition Status: $status");
        },
      );

      if (available) {
        _startListening(onSpeechResult);
        _listeningCheckTimer = Timer.periodic(
          const Duration(seconds: 2),
              (timer) {
            if (!_isListening && _speechToText.isAvailable) {
              _startListening(onSpeechResult);
            }
          },
        );
      } else {
        print("Speech recognition not available on this device.");
      }
    } else {
      openAppSettings();
    }
  }

  void _startListening(Function(String) onSpeechResult) async {
    _isListening = true;
    await _speechToText.listen(
      onResult: (SpeechRecognitionResult result) {
        onSpeechResult(result.recognizedWords);
      },
      listenFor: const Duration(minutes: 30),
      partialResults: true,
    );
  }

  void dispose() {
    _listeningCheckTimer.cancel();
    _speechToText.stop();
  }
}
