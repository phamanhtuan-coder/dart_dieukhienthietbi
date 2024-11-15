import 'package:flutter/material.dart';
import 'InfoScreen.dart';
import 'StatisticsScreen.dart';
import 'ControlScreen.dart';
import 'TeamInfoScreen.dart';

List<Widget> getTabViews() {
  return [
    InfoScreen(),
    StatisticsScreen(),
    ControlScreen(),
    TeamInfoScreen(),
  ];
}
