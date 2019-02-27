import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/configuration/Theme.dart';
import 'package:gym_track/generic/ModelState.dart';
import 'package:gym_track/screens/home/HomePage.dart';
import 'package:gym_track/viewmodel/UserViewModel.dart';

class LoginScreen extends StatelessWidget {
  final LoginScreenViewModel _viewModel;

  LoginScreen(this._viewModel) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login to youe account"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              autocorrect: false,
              autofocus: true,
              decoration: InputDecoration(hintText: "Email"),
              maxLines: 1,
              onChanged: _emailChanged,
            ),
            TextField(
              autocorrect: false,
              autofocus: true,
              decoration: InputDecoration(hintText: "Password"),
              maxLines: 1,
              obscureText: true,
              onChanged: _emailChanged,
            ),
          ],
        ),
      ),
    );
  }

  void _passwordChanged(String text) {}
  void _emailChanged(String text) {}
}

class LoginScreenViewModel {
  UserViewModel _userViewModel;

  // TODO: Find a way to properly do this
  ModelState<LoginScreenState> _state = ModelState(LoginStateFilling());
  ModelState<LoginScreenState> get state {
    return _state;
  }

  LoginScreenViewModel(this._userViewModel);

  void login() {}
}

abstract class LoginScreenState extends Equatable {
  LoginScreenState([props]) : super([props]);
}

class LoginStateFilling extends LoginScreenState {
  String email;
  String password;
  String error;
  bool isLoading;

  LoginStateFilling(
      {Key, this.email = "", this.password = "", this.error, this.isLoading})
      : super([LoginStateFilling, error, isLoading]);
}

class LoginStateLoaded extends LoginScreenState {
  HomeScreenViewModel homeViewModel;

  LoginStateLoaded(userViewModel) : super([LoginStateLoaded]) {
    this.homeViewModel = HomeScreenViewModel(userViewModel);
  }
}
