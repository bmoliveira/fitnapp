import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/screens/activity/ActivityScreen.dart';
import 'package:gym_track/screens/exercise_session/ExerciseSessionScreen.dart';
import 'package:gym_track/screens/profile/ProfileScreen.dart';
import 'package:gym_track/view/TabItem.dart';
import 'package:gym_track/viewmodel/UserViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this._homeScreenViewModel) : super();

  final HomeScreenViewModel _homeScreenViewModel;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeTabControllerModel>(
      model: _homeScreenViewModel.homeTabControllerModel,
      child: ScopedModelDescendant<HomeTabControllerModel>(
          rebuildOnChange: true,
          builder: (context, child, tabController) {
            return Scaffold(
              body: tabController.content,
              bottomNavigationBar: BottomNavigationBar(
                items: tabController.navItems,
                currentIndex: tabController.currentSelectedItem,
                onTap: tabController.itemSelected,
              ),
            );
          }),
    );
  }
}

class HomeScreenViewModel extends Model {
  UserViewModel userViewModel;

  HomeTabControllerModel homeTabControllerModel;

  HomeScreenViewModel(this.userViewModel) : super() {
    homeTabControllerModel = HomeTabControllerModel();
  }
}

class HomeTabControllerModel extends Model {
  int _currentSelectedItem = 1;

  HomeTabControllerModel() : super();

  List<TabItem> _items = <TabItem>[
    ActivityTabItem(),
    ExerciseSessionTabItem(),
    ProfileTabItem(),
  ];

  int get currentSelectedItem => _currentSelectedItem;

  List<BottomNavigationBarItem> get navItems =>
      _items.map((item) => item.tabItem).toList(growable: false);

  Widget get content => _items[_currentSelectedItem].content;

  void itemSelected(int index) {
    if (index == _currentSelectedItem) return;
    _currentSelectedItem = index;
    notifyListeners();
  }
}
