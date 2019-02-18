import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/app/ApplicationSharedModel.dart';
import 'package:gym_track/configuration/Theme.dart';
import 'package:gym_track/generic/ModelState.dart';
import 'package:gym_track/screens/splash/SplashScreen.dart';
import 'package:gym_track/viewmodel/user/UserAuthState.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  // This widget is the root of your application.
  final ApplicationModel applicationModel = ApplicationModel();

  @override
  Widget build(BuildContext context) {
    return new ScopedModel<ModelState<UserAuthState>>(
        model: applicationModel.userViewModel.userAuthState,
        child: ScopedModelDescendant<ModelState<UserAuthState>>(
            rebuildOnChange: true,
            builder: (context, child, model) {
              return MaterialApp(
                title: 'FitNapp',
                theme: ApplicationTheme.themeData,
                home: SplashScreen(applicationModel.splashViewModel),
              );
            }));
  }
}
