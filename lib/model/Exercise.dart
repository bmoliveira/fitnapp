class Exercise {
  Exercise(name, type, icon);

  String name;
  ExerciseType type;
  ExerciseIcon icon;
}

class ExerciseType {
  ExerciseType(identifier, name);

  String identifier;
  String name;
}

class ExerciseIcon {}

class ExerciseIcons {}

class ActivityExercise {
  ActivityExercise(exercise, _duration);

  Exercise exercise;
  Duration _duration;
}

class ActivitySession {
  List<ActivityExercise> exercises = List();
  Duration _duration = Duration();
}

class Duration {
  Duration() {
    startDate = DateTime.now();
  }

  DateTime startDate;
  DateTime endDate;
}
