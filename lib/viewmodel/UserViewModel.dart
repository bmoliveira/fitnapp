import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_track/generic/ModelState.dart';
import 'package:gym_track/viewmodel/user/UserAuthState.dart';
import 'package:gym_track/viewmodel/user/UserInfoState.dart';

/// The UserViewModel will be the instance responsible for providing the user
/// instance through all the application.
class UserViewModel {

  /// Will change the state on logout, login or register of the user.
  ModelState<UserAuthState> userAuthState = ModelState(Initializing());

  /// User basic information, this will change when we have like user profile
  /// changes and settings.
  ModelState<UserInfoState> userInfoState = ModelState(NoInformation());

  /// For now this will be our auth provider.
  FirebaseAuth _auth = FirebaseAuth.instance;

  /// Initialize the user state properly, at the end we will know if the we have
  /// a logged user or not.
  void initialize() async {
    await _auth.currentUser()
        .then((user) { userAuthState.value = LoggedUser(user); })
        .catchError((error) {
      print(error);
      userAuthState.value = NoUser();
    });
  }
}
