import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/view/TabItem.dart';

class ExerciseSessionTabItem implements TabItem {
  @override
  Widget get content => Center(child: Text("New exercise session"));

  @override
  BottomNavigationBarItem get tabItem => BottomNavigationBarItem(
      icon: Icon(Icons.power_settings_new), title: Text('Session'));
}
