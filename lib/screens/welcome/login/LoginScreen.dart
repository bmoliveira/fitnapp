import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_track/configuration/AppIcons.dart';
import 'package:gym_track/configuration/Theme.dart';
import 'package:gym_track/generic/Buttons.dart';
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
        title: Text("Login"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 42, right: 42, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _logo,
              TextField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(hintText: "Email"),
                maxLines: 1,
                onChanged: _emailChanged,
              ),
              SizedBox(height: 18),
              TextField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(hintText: "Password"),
                maxLines: 1,
                obscureText: true,
                onChanged: _passwordChanged,
              ),
              SizedBox(height: 42),
              _loginButton(context),
              SizedBox(height: 8),
              _registerButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return Hero(
        tag: "Register",
        child: FitTextButton("Don't have an account? Create here",
            isUnderscored: false, onPressed: () => {}));
  }

  Widget _loginButton(BuildContext context) {
    return Hero(
        tag: "Login",
        child: ProgressButton("Login", true, onPressed: () => {}));
  }

  Widget get _logo {
    return Flexible(
      fit: FlexFit.loose,
      child: Hero(
        tag: "logo",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: SvgPicture.asset(AppIcons.AppIconPath,
                    width: 100, height: 100)),
            Container(height: 24),
            Text(
              "Welcome back",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: ApplicationTheme.current.textColor,
                  fontSize: 20,
                  decorationStyle: TextDecorationStyle.double,
                  decoration: TextDecoration.combine([])),
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
