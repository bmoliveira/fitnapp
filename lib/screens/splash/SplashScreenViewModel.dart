import 'package:gym_track/screens/sign_up/SignUp.dart';
import 'package:gym_track/screens/splash/SplashScreenLoadingModel.dart';
import 'package:gym_track/viewmodel/UserViewModel.dart';

class SplashScreenViewModel {
  UserViewModel userViewModel;

  SignUpViewModel signupViewModel;

  SplashScreenLoadingModel loadingViewModel;

  SplashScreenViewModel(this.userViewModel) {
    signupViewModel = SignUpViewModel(userViewModel);
    loadingViewModel = SplashScreenLoadingModel(userViewModel);
  }
}
