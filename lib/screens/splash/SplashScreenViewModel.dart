import 'package:equatable/equatable.dart';
import 'package:gym_track/generic/ModelState.dart';
import 'package:gym_track/screens/home/HomePage.dart';
import 'package:gym_track/screens/sign_up/SignUp.dart';
import 'package:gym_track/viewmodel/UserViewModel.dart';

class SplashScreenViewModel {
  /// Shared instance of the [UserViewModel]
  UserViewModel _userViewModel;

  SignUpViewModel get signupViewModel {
    return SignUpViewModel(_userViewModel);
  }

  ModelState<LoadingState> loadingState = ModelState(Loading());

  SplashScreenViewModel(this._userViewModel);

  void load() async {
    final user = await _userViewModel.initialize();

    if (user == null) {
      loadingState.value = Loaded(SignUpViewModel(_userViewModel));
      return;
    }
    loadingState.value = Loaded(HomeScreenViewModel(_userViewModel));
  }
}

class ContentViewModel {}

abstract class LoadingState<T> extends Equatable {
  LoadingState([props = const []]) : super(props);
}

class Loading<T> extends LoadingState<T> {}

class Loaded<T> extends LoadingState<T> {
  T value;

  Loaded(this.value) : super([value]);
}
