import 'package:flutter/material.dart';
import 'package:test_embedded_management/models/SensorData.dart';
import 'package:test_embedded_management/services/SensorDataProvider.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  _SensorInfoScreenState createState() => _SensorInfoScreenState();
}

class _SensorInfoScreenState extends State<InfoScreen>{
  final SensorDataProvider dataProvider = SensorDataProvider();
  late SensorData data;

  @override
  void initState() {
    super.initState();
    setState(() {
      data = dataProvider.getSensorDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thông tin cảm biến",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SensorTile(iconData: Icons.thermostat, label: 'Nhiệt độ', value: '${data.temperature}°C'),
          SensorTile(iconData: Icons.wb_sunny, label: 'Ánh sáng', value: '${data.light} lux'),
          SensorTile(iconData: Icons.water_drop, label: 'Độ ẩm', value: '${data.humidity}%'),
          SensorTile(iconData: Icons.sensors, label: 'Khoảng cách', value: '${data.distance} cm'),
          SensorTile(iconData: Icons.waves, label: 'Mực nước', value: '${data.waterLevel} cm'),
        ],
      ),
    );
  }
}

class SensorTile extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String value;

  const SensorTile({super.key,
    required this.iconData,
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(iconData, size: 30, color: const Color(0xFF614C99)),
        title: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: Text(value, style: const TextStyle(fontSize: 16),),
      ),
    );
  }
}