
import 'package:flutter/material.dart';
import '../../models/Device.dart';


class DeviceCard extends StatefulWidget {
  final Device device;
  final Function(Device) onDeviceUpdated;

  const DeviceCard({
    Key? key,
    required this.device,
    required this.onDeviceUpdated,
  }) : super(key: key);

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  late bool isOn;
  late double brightness;

  @override
  void initState() {
    super.initState();
    isOn = widget.device.isOn;
    brightness = widget.device.brightness;
  }

  void _updateDevice() {
    widget.onDeviceUpdated(
      Device(name: widget.device.name, isOn: isOn, brightness: brightness),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                widget.device.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Trạng thái: ${isOn ? "Đang bật" : "Đang tắt"}'),
              leading: Icon(
                isOn ? Icons.lightbulb : Icons.lightbulb_outline,
                color: isOn ? Colors.yellow : Colors.grey,
                size: 32,
              ),
              trailing: Switch(
                value: isOn,
                onChanged: (value) {
                  setState(() {
                    isOn = value;
                  });
                  _updateDevice();
                },
                activeColor: Colors.green,
              ),
            ),
            const Divider(),
            const Text('Độ sáng:'),
            Slider(
              value: brightness,
              min: 0.0,
              max: 1.0,
              divisions: 10,
              label: '${(brightness * 100).round()}%',
              onChanged: (value) {
                setState(() {
                  brightness = value;
                });
                _updateDevice();
              },
            ),
          ],
        ),
      ),
    );
  }
}