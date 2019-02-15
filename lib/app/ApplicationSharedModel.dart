import 'package:gym_track/screens/splash/SplashScreenViewModel.dart';
import 'package:gym_track/viewmodel/UserViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class ApplicationModel {
  UserViewModel userViewModel = UserViewModel();

  SplashScreenViewModel splashViewModel;

  ApplicationModel() : super() {
    splashViewModel = SplashScreenViewModel(userViewModel);
  }
}
