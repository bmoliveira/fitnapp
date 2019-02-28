import 'package:gym_track/screens/welcome/login/LoginScreen.dart';
import 'package:gym_track/screens/welcome/register/RegisterAccountViewModel.dart';
import 'package:gym_track/viewmodel/UserViewModel.dart';

class WelcomeScreenViewModel {
  UserViewModel _userViewModel;

  WelcomeScreenViewModel(this._userViewModel) : super();

  LoginScreenBloc get loginViewModel {
    return LoginScreenBloc(_userViewModel);
  }
}
