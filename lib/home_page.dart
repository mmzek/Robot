import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pattern.dart';
import 'sensors/proximity_sensor.dart';
import 'sensors/voice_control.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Pattern _pattern = Pattern();
  final VoiceControl _voiceControl = VoiceControl();
  final Sensor _sensor = Sensor();

  @override
  void initState() {
    super.initState();
    _voiceControl.initializeSpeechRecognition(onSpeechResult: _onSpeechResult);
    _sensor.listenSensor((isNearby) {
      setState(() {
        _pattern.nearby = isNearby;
        _pattern.controlSequence();
      });
    });
  }

  void _onSpeechResult(String recognizedWords) {
    setState(() {
      _pattern.processSpeechCommand(recognizedWords);
    });
  }

  @override
  void dispose() {
    _sensor.dispose();
    _voiceControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              _pattern.getSequenceText(),
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                width: 40,
                height: 40,
                color: _pattern.squares[index] ? Colors.white : Colors.black,
              );
            }),
          ),
        ],
      ),
    );
  }
}
