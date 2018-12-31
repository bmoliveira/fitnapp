import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/view/TabItem.dart';

class ProfileTabItem implements TabItem {
  @override
  Widget get content => Center(child: Text("Profile"));

  @override
  BottomNavigationBarItem get tabItem => BottomNavigationBarItem(
      icon: Icon(Icons.supervised_user_circle), title: Text('Profile'));
}
