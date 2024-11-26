import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  _ControlScreen createState() => _ControlScreen();
}

class _ControlScreen extends State<ControlScreen> {
  // Kết nối Firebase cho từng cảm biến
  final DatabaseReference _lightStatus =
      FirebaseDatabase.instance.ref().child('light_status');
  String lightStatus = '';

  // Biến trạng thái cho các cảm biến
  bool isTemperatureEnable = true;
  bool isLightEnabled = true;
  bool isHumidityEnable = true;
  bool isDistanceEnable = true;
  bool isWaterLevelEnabled = true;
  double waterLevelAlert = 30;

  @override
  Widget build(BuildContext context) {
    // Lắng nghe thay đổi từ Firebase cho đèn
    _lightStatus.onValue.listen((event) {
      print('Firebase value: ${event.snapshot.value}');
      setState(() {
        lightStatus = event.snapshot.value.toString();
        isLightEnabled = (lightStatus == 'ON') ? true : false;
      });
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Điều khiển",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Card Nhiệt độ
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SensorControl(
                          title: "Nhiệt độ",
                          controls: [
                            SwitchListTile(
                              title: const Text("Bật/Tắt cảm biến nhiệt độ"),
                              value: isTemperatureEnable,
                              onChanged: (bool value) {
                                setState(() {
                                  isTemperatureEnable = value;
                                });
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Khởi tạo lại đo nhiệt độ"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Card Ánh sáng với Firebase
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SensorControl(
                          title: "Ánh sáng",
                          controls: [
                            SwitchListTile(
                              title: const Text("Bật/Tắt đèn"),
                              value: isLightEnabled,
                              onChanged: (bool value) {
                                setState(() {
                                  isLightEnabled = value;
                                  // Gửi trạng thái lên Firebase
                                  (value == true)
                                      ? _lightStatus.set('ON')
                                      : _lightStatus.set('OFF');
                                  print(
                                      'Light status set to: ${value ? 'ON' : 'OFF'}');
                                });
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Trạng thái: $lightStatus',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Khởi tạo lại đo ánh sáng"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Card Độ ẩm
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SensorControl(
                          title: "Độ ẩm",
                          controls: [
                            SwitchListTile(
                              title: const Text("Bật/Tắt cảm biến độ ẩm"),
                              value: isHumidityEnable,
                              onChanged: (bool value) {
                                setState(() {
                                  isHumidityEnable = value;
                                });
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Khởi tạo lại đo độ ẩm"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Card Khoảng cách
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SensorControl(
                          title: "Khoảng cách",
                          controls: [
                            SwitchListTile(
                              title: const Text("Bật/Tắt cảm biến khoảng cách"),
                              value: isDistanceEnable,
                              onChanged: (bool value) {
                                setState(() {
                                  isDistanceEnable = value;
                                });
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Khởi tạo lại đo khoảng cách"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Card Mực nước
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SensorControl(
                          title: "Mực nước",
                          controls: [
                            SwitchListTile(
                              title: const Text("Bật/Tắt cảm biến mực nước"),
                              value: isWaterLevelEnabled,
                              onChanged: (bool value) {
                                setState(() {
                                  isWaterLevelEnabled = value;
                                });
                              },
                            ),
                            Slider(
                              value: waterLevelAlert,
                              min: 0,
                              max: 100,
                              divisions: 10,
                              label: waterLevelAlert.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  waterLevelAlert = value;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SensorControl extends StatelessWidget {
  final String title;
  final List<Widget> controls;

  const SensorControl({super.key, required this.title, required this.controls});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...controls,
      ],
    );
  }
}