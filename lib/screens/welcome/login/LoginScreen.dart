import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_track/configuration/AppIcons.dart';
import 'package:gym_track/configuration/Theme.dart';
import 'package:gym_track/generic/BlocProvider.dart';
import 'package:gym_track/generic/Buttons.dart';
import 'package:gym_track/generic/FitSingleChildScrollView.dart';
import 'package:gym_track/generic/Validators.dart';
import 'package:gym_track/viewmodel/UserViewModel.dart';
import 'package:rxdart/rxdart.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginScreenBloc loginScreenBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SafeArea(
        child: BoundedSingleChildScrollView(
          minHeight: 450,
          child: Padding(
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
                _loginButton(context, loginScreenBloc),
                SizedBox(height: 8),
                _registerButton(context)
              ],
            ),
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

  Widget _loginButton(BuildContext context, LoginScreenBloc bloc) {
    return Hero(
        tag: "Login",
        child: ProgressButton("Login",
            isLoading: bloc.isLoading, onPressed: () => bloc.login()));
  }

  Widget get _logo {
    return Flexible(
      fit: FlexFit.loose,
      child: Hero(
        tag: "logo",
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
      ),
    );
  }

  void _passwordChanged(String text) {}

  void _emailChanged(String text) {}
}

class LoginScreenBloc implements BlocBase {
  LoginScreenBloc(this._userViewModel);

  UserViewModel _userViewModel;

  PublishSubject<bool> _loadingSubject = PublishSubject<bool>();

  Observable<bool> get isLoading => _loadingSubject.stream;

  PublishSubject<String> _errorEmailSubject = PublishSubject<String>();

  Observable<String> get errorEmail => _errorEmailSubject.stream;

  String _email = "";

  get email => _email;

  set(value) {
    _email = value;
    if (_currentEmailError != null) _validateForm();
  }

  String password = "";

  String _currentEmailError;

  void login() {
    _loadingSubject.add(true);
    if (!_validateForm()) return;
    _loadingSubject.add(true);
  }

  bool _validateForm() {
    var hasErrors = false;

    if (!EmailValidator.isValid(email)) {
      _currentEmailError = "Invalid Email";
      _errorEmailSubject.add(_currentEmailError);
      hasErrors = true;
    }

    return hasErrors;
  }

  @override
  void dispose() {
    _loadingSubject.sink.close();
    _errorEmailSubject.sink.close();
  }
}
