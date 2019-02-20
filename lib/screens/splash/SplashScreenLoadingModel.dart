import 'package:gym_track/model/User.dart';
import 'package:gym_track/model/UserLoadingState.dart';
import 'package:gym_track/screens/home/HomePage.dart';
import 'package:gym_track/screens/welcome/welcome/WelcomeScreenViewModel.dart';
import 'package:gym_track/viewmodel/UserViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class SplashScreenLoadingModel extends Model {
  UserViewModel _userViewModel;

  SplashScreenLoadingModel(this._userViewModel);

  CurrentUserState userState = UserStateLoading();

  HomeScreenViewModel get homeScreenViewModel =>
      HomeScreenViewModel(_userViewModel);

  WelcomeScreenViewModel get signUpViewModel =>
      WelcomeScreenViewModel(_userViewModel);

  Future loadUser() async {
    var user = await _initDummyUser();
    userState = UserStateLoaded(user);
    notifyListeners();
  }

  Future<User> _initDummyUser() async {
    return Future.delayed(Duration(seconds: 2), () => new User("Bruno"));
  }
}
