import 'package:flutter/widgets.dart';

abstract class TabItem {
  BottomNavigationBarItem get tabItem;

  Widget get content;
}
