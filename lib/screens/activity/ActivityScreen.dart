import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/view/TabItem.dart';

class ActivityTabItem implements TabItem {
  @override
  Widget get content => Center(child: Text("Activity"));

  @override
  BottomNavigationBarItem get tabItem => BottomNavigationBarItem(
      icon: Icon(Icons.history), title: Text('Activity'));
}
