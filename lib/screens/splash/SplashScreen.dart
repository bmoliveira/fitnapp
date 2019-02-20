import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gym_track/generic/FitnessNavigatior.dart';
import 'package:gym_track/generic/LoadingState.dart';
import 'package:gym_track/generic/ModelState.dart';
import 'package:gym_track/screens/home/HomePage.dart';
import 'package:gym_track/screens/welcome/welcome/WelcomeScreenViewModel.dart';
import 'package:gym_track/screens/splash/SplashScreenViewModel.dart';
import 'package:gym_track/screens/welcome/welcome/WelcomeScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenViewModel _viewModel;

  SplashScreen(this._viewModel) : super();

  @override
  Widget build(BuildContext context) {
    _viewModel.load();
    return ScopedModel(
        model: _viewModel.loadingState,
        child: Container(
          color: Colors.white,
          child: Center(
            child: new ScopedModelDescendant<ModelState<LoadingState>>(
                rebuildOnChange: false,
                builder: (context, child, state) {
                  final currentState = state.value;
                  if (currentState is Loaded) {
                    _handleLoadedState(context, currentState);
                  }
                  return _loadingView();
                }),
          ),
        ));
  }

  void _handleLoadedState(BuildContext context, Loaded state) {
    final stateValue = state.value;
    if (stateValue is WelcomeScreenViewModel) {
      FitnessNavigator.pushSignUp(context,
          MaterialPageRoute(builder: (context) {
        return WelcomeScreen(stateValue);
      }));
    } else if (stateValue is HomeScreenViewModel) {
      FitnessNavigator.pushContent(context,
          MaterialPageRoute(builder: (context) {
        return HomeScreen(stateValue);
      }));
    } else {
      throw Exception("Invalid current loadedValueState provided: $stateValue");
    }
  }

  Widget _loadingView() {
    return SpinKitPumpingHeart(
      color: Colors.deepOrange,
      size: 100,
    );
  }
}
