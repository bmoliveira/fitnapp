import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/app/ApplicationSharedModel.dart';
import 'package:gym_track/screens/splash/SplashScreen.dart';
import 'package:gym_track/viewmodel/UserViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  // This widget is the root of your application.
  final ApplicationSharedModel applicationModel = ApplicationSharedModel();

  @override
  Widget build(BuildContext context) {
    return new ScopedModel<UserViewModel>(
        model: applicationModel.userViewModel,
        child: ScopedModelDescendant<UserViewModel>(
            rebuildOnChange: false,
            builder: (context, child, userViewModel) {
              return MaterialApp(
                title: 'FitNapp',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: SplashScreen(applicationModel.splashViewModel),
              );
            }));
  }
}
