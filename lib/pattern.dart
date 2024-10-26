import 'dart:async';

class Pattern {
  List<bool> squares = [false, false, false, false, false];
  bool nearby = false;
  int sequence = 0;

  void controlSequence() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (nearby) {
        sequence = 1;
        updateSquarePattern();
        Future.delayed(const Duration(seconds: 3), () {
          sequence = 0;
          updateSquarePattern();
        });
      } else {
        sequence = 0;
        updateSquarePattern();
      }
    });
  }

  void processSpeechCommand(String command) {
    if (command.contains("forward")) {
      sequence = 0;
    } else if (command.contains("backward")) {
      sequence = 1;
    } else if (command.contains("left")) {
      sequence = 2;
    } else if (command.contains("right")) {
      sequence = 3;
    }
    updateSquarePattern();
  }

  void updateSquarePattern() {
    switch (sequence) {
      case 0:
        squares = [true, false, false, false, true];
        break; // forward
      case 1:
        squares = [false, true, false, true, false];
        break; // backward
      case 2:
        squares = [true, false, false, true, false];
        break; // left
      case 3:
        squares = [false, true, false, false, true];
        break; // right
      default:
        squares = [false, false, false, false, false];
        break;
    }
  }

  String getSequenceText() {
    switch (sequence) {
      case 0:
        return "Forward";
      case 1:
        return "Backward";
      case 2:
        return "Left";
      case 3:
        return "Right";
      default:
        return "";
    }
  }
}
