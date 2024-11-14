// home_page.dart
import 'package:dieukhienthietbi/models/device.dart';
import 'package:dieukhienthietbi/views/widgets/device_card.dart';
import 'package:flutter/material.dart';

import 'chart_page.dart'; // Import the ChartPage here

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Device> devices = List.generate(
    5,
        (index) => Device(name: 'Thiết bị ${index + 1}'),
  );

  void _updateDevice(Device updatedDevice) {
    setState(() {
      final index = devices.indexWhere((device) => device.name == updatedDevice.name);
      if (index != -1) {
        devices[index] = updatedDevice;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nhóm Anh Tuấn - App Điều Khiển Thiết Bị',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(16.0),
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        tooltip: 'Home',
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.analytics),
                onPressed: () {
                  // Navigate to ChartPage, passing the list of devices
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChartPage(devices: devices),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.device_hub),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const HomePage(),
                  ),
                  );
                },
              ),
              const SizedBox(width: 48),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          itemCount: devices.length,
          itemBuilder: (context, index) {
            final device = devices[index];
            return DeviceCard(
              device: device,
              onDeviceUpdated: _updateDevice,
            );
          },
        ),
      ),
    );
  }
}