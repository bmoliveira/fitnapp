import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserInfoState extends Equatable {
  UserInfoState([props = const []]) : super(props);
}

class NoInformation extends UserInfoState {}

class UserInformation extends UserInfoState {
  FirebaseUser _user;
  UserInformation(this._user) : super([_user.hashCode]);
}
