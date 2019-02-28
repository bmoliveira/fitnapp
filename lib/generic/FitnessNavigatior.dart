import 'package:flutter/material.dart';
import 'package:gym_track/generic/BlocProvider.dart';
import 'package:gym_track/screens/welcome/login/LoginScreen.dart';

class FitnessNavigator {
  static void _push(VoidCallback callback) {
    Future.microtask(() => callback());
  }

  static Route generateRouteForLogin(LoginScreenBloc bloc) {
    return MaterialPageRoute(builder: (context) {
      return BlocProvider<LoginScreenBloc>(
        bloc: bloc,
        child: LoginScreen(),
      );
    });
  }

  static void pushLogin(BuildContext context, Route route) {
    _push(() => Navigator.of(context).push(route));
  }

  static void pushWelcome(BuildContext context, Route route) {
    _push(() => Navigator.of(context).pushReplacement(route));
  }

  static void pushContent(BuildContext context, Route route) {
    _push(() => Navigator.of(context).pushReplacement(route));
  }
}
