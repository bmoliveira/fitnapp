import 'package:gym_track/model/User.dart';

abstract class CurrentUserState {}

class UserStateNone implements CurrentUserState {}

class UserStateLoading implements CurrentUserState {}

class UserStateLoaded implements CurrentUserState {
  UserStateLoaded(this.user);
  User user;
}
