import 'package:flutter/material.dart';

class FitnessNavigator {
  static void _push(VoidCallback callback) {
    Future.microtask(() => callback());
  }

  static void pushSignUp(BuildContext context, Route route) {
    _push(() => Navigator.of(context).pushReplacement(route));
  }

  static void pushContent(BuildContext context, Route route) {
    _push(() => Navigator.of(context).pushReplacement(route));
  }
}
