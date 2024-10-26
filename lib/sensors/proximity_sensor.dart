import 'package:proximity_sensor/proximity_sensor.dart';
import 'dart:async';

class Sensor {
  late StreamSubscription<dynamic> _streamSubscription;

  void listenSensor(Function(bool) onProximityChange) {
    _streamSubscription = ProximitySensor.events.listen((int event) {
      onProximityChange(event > 0);
    });
  }

  void dispose() {
    _streamSubscription.cancel();
  }
}