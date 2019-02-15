import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserAuthState extends Equatable {
  UserAuthState([props = const []]): super(props);
}

class Initializing extends UserAuthState {}
class NoUser extends UserAuthState {}
class LoggedUser extends UserAuthState {
  FirebaseUser user;
  LoggedUser(this.user): super([user.uid]);
}
