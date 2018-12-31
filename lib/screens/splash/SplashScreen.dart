import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gym_track/model/UserLoadingState.dart';
import 'package:gym_track/screens/home/HomePage.dart';
import 'package:gym_track/screens/sign_up/SignUp.dart';
import 'package:gym_track/screens/splash/SplashScreenLoadingModel.dart';
import 'package:gym_track/screens/splash/SplashScreenViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenViewModel _viewModel;

  SplashScreen(this._viewModel) : super();

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: _viewModel.loadingViewModel,
        child: Container(
          color: Colors.white,
          child: Center(
            child: new ScopedModelDescendant<SplashScreenLoadingModel>(
                builder: (context, child, splashLoadingViewModel) {
              final currentState = splashLoadingViewModel.userState;
              if (currentState is UserStateNone) {
                return new Center(
                  child: SignUpScreen(splashLoadingViewModel.signUpViewModel),
                );
              } else if (currentState is UserStateLoading) {
                splashLoadingViewModel.loadUser();
                return SpinKitPumpingHeart(
                  color: Colors.deepOrange,
                  size: 100,
                );
              } else if (currentState is UserStateLoaded) {
                return HomeScreen(splashLoadingViewModel.homeScreenViewModel);
              }
            }),
          ),
        ));
  }
}
