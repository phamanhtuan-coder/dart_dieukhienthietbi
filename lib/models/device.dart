// device.dart
class Device {
  final String name;
  bool isOn;
  double brightness;

  Device({
    required this.name,
    this.isOn = false,
    this.brightness = 0.5,
  });
}