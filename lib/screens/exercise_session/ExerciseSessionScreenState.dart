import 'package:flutter/widgets.dart';
import 'package:gym_track/model/Exercise.dart';

abstract class ExerciseSessionScreenState {}

class NoSession implements ExerciseSessionScreenState {}

class EmptySession implements ExerciseSessionScreenState {
  EmptySession({Key key, this.session}) : assert(session != null);

  ActivitySession session;
}

class CurrentSession implements ExerciseSessionScreenState {
  CurrentSession({Key key, this.session}) : assert(session != null);

  ActivitySession session;
}
