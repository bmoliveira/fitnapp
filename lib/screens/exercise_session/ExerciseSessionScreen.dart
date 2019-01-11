import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/view/PulseContainer.dart';
import 'package:gym_track/view/TabItem.dart';

class ExerciseSessionTabItem implements TabItem {
  @override
  Widget get content => ExerciseScreen();

  @override
  BottomNavigationBarItem get tabItem => BottomNavigationBarItem(
      icon: Icon(Icons.power_settings_new), title: Text('Session'));
}

class ExerciseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PulseContainer(
          color: Colors.amber,
          child: Container(
            width: 200,
            height: 200,
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              color: Colors.yellowAccent,
              onPressed: () => {},
            ),
          ),
        ),
      ),
    );
  }
}
