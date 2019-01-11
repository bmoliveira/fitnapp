import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/model/Exercise.dart';
import 'package:gym_track/screens/exercise_session/ExerciseSessionScreenState.dart';
import 'package:gym_track/view/PulseContainer.dart';
import 'package:gym_track/view/TabItem.dart';
import 'package:scoped_model/scoped_model.dart';

class ExerciseSessionTabItem implements TabItem {
  ExerciseSessionViewModel _viewModel = ExerciseSessionViewModel();

  ExerciseSessionTabItem() : super() {
    content = new ScopedModel(model: _viewModel, child: ExerciseScreen());
  }

  @override
  Widget content;

  @override
  BottomNavigationBarItem get tabItem => BottomNavigationBarItem(
      icon: Icon(Icons.power_settings_new), title: Text('Session'));
}

class ExerciseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ExerciseSessionViewModel>(
        builder: (context, child, viewModel) {
      final ExerciseSessionScreenState state = viewModel.state;
      if (state is NoSession) {
        return _noSessionContent(viewModel);
      } else if (state is EmptySession) {
        return _emptySessionContent(viewModel);
      } else {
        return _currentSession(viewModel);
      }
    });
  }

  void _createSession() {}

  void _addExercise() {}

  Widget _noSessionContent(ExerciseSessionViewModel viewModel) {
    return new Scaffold(
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
            onPressed: () => viewModel.createSession(),
          ),
        ),
      ),
    ));
  }

  Widget _emptySessionContent(ExerciseSessionViewModel viewModel) {
    return new Scaffold(
      floatingActionButton: _floatingActionButton(viewModel),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }

  Widget _currentSession(ExerciseSessionViewModel viewModel) {
    return new Scaffold(
      floatingActionButton: _floatingActionButton(viewModel),
      body: Container(color: Colors.white),
    );
  }

  Widget _floatingActionButton(ExerciseSessionViewModel viewModel) =>
      IconButton(
          icon: Icon(Icons.add), onPressed: () => viewModel.addExercise());
}

class ExerciseSessionViewModel extends Model {
  ExerciseSessionScreenState state = NoSession();

  ActivitySession _currentSession;

  void createSession() {
    _currentSession = ActivitySession();
    state = EmptySession(session: _currentSession);
    notifyListeners();
  }

  void addExercise() {
    state = CurrentSession(session: _currentSession);
    notifyListeners();
  }
}

class ExerciseSessionViewState extends Model {}
