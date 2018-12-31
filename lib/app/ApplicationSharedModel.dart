import 'package:gym_track/screens/splash/SplashScreenViewModel.dart';
import 'package:gym_track/viewmodel/UserViewModel.dart';

class ApplicationSharedModel {
  UserViewModel userViewModel = UserViewModel();

  SplashScreenViewModel splashViewModel;

  ApplicationSharedModel() : super() {
    splashViewModel = SplashScreenViewModel(userViewModel);
  }
}
