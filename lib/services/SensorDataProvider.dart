import '../models/SensorData.dart';

class SensorDataProvider {
  SensorData getSensorDate() {
    return SensorData(
        temperature: 25.0,
        light: 300.0,
        humidity: 60.0,
        distance: 15.0,
        waterLevel: 10.0
    );
  }
}