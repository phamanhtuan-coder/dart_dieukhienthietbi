import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Thông tin cảm biến",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "Nhiệt độ"),
              Tab(text: "Ánh sáng"),
              Tab(text: "Độ ẩm"),
              Tab(text: "Khoảng cách"),
              Tab(text: "Mực nước"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AttributeStatistics(attributeName: "Nhiệt độ"),
            AttributeStatistics(attributeName: "Ánh sáng"),
            AttributeStatistics(attributeName: "Độ ẩm"),
            AttributeStatistics(attributeName: "Khoảng cách"),
            AttributeStatistics(attributeName: "Mực nước"),
          ],
        ),
      ),
    );
  }
}

class AttributeStatistics extends StatelessWidget {
  final String attributeName;

  AttributeStatistics({required this.attributeName});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        SectionHeader(title: "$attributeName - Biểu đồ tròn"),
        PieChartWidget(attributeName: attributeName),
        SectionHeader(title: "$attributeName - Biểu đồ cột"),
        BarChartWidget(attributeName: attributeName),
        SectionHeader(title: "$attributeName - Biểu đồ đường"),
        LineChartWidget(attributeName: attributeName),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  final String attributeName;

  PieChartWidget({required this.attributeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(value: 40, color: Colors.blue, title: '40%'),
            PieChartSectionData(value: 30, color: Colors.green, title: '30%'),
            PieChartSectionData(value: 20, color: Colors.orange, title: '20%'),
            PieChartSectionData(value: 10, color: Colors.red, title: '10%'),
          ],
          centerSpaceRadius: 40,
        ),
      ),
    );
  }
}

class BarChartWidget extends StatelessWidget {
  final String attributeName;

  BarChartWidget({required this.attributeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(
              x: 1,
              barRods: [BarChartRodData(toY: 8, color: Colors.blue)],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [BarChartRodData(toY: 10, color: Colors.green)],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [BarChartRodData(toY: 14, color: Colors.orange)],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [BarChartRodData(toY: 15, color: Colors.red)],
            ),
          ],
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
          ),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  final String attributeName;

  const LineChartWidget({super.key, required this.attributeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 5,
          minY: 0,
          maxY: 4,
          gridData: const FlGridData(show: true),
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 1),
                const FlSpot(1, 2.8),
                const FlSpot(2, 1.2),
                const FlSpot(3, 2.8),
                const FlSpot(4, 3.5),
              ],
              isCurved: true,
              gradient: const LinearGradient(colors: [Colors.blue, Colors.green]),
              barWidth: 4,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}