import 'package:equatable/equatable.dart';

abstract class LoadingState<T> extends Equatable {
  LoadingState([props = const []]) : super(props);
}

class Loading<T> extends LoadingState<T> {}

class Loaded<T> extends LoadingState<T> {
  T value;

  Loaded(this.value) : super([value]);
}
