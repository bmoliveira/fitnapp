import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/configuration/AppIcons.dart';
import 'package:gym_track/configuration/Theme.dart';
import 'package:gym_track/generic/Buttons.dart';
import 'package:gym_track/generic/FitnessNavigatior.dart';
import 'package:gym_track/screens/welcome/login/LoginScreen.dart';
import 'package:gym_track/screens/welcome/welcome/WelcomeScreenViewModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen(this._welcomeScreenViewModel) : super();

  final WelcomeScreenViewModel _welcomeScreenViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.maxFinite,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            //alignment:new Alignment(x, y)
            children: <Widget>[_logo, _buttonsGroup(context)],
          ),
        ),
      ),
    );
  }

  Widget get _logo {
    return Expanded(
      child: Hero(
        tag: "logo",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: SvgPicture.asset(AppIcons.AppIconPath,
                    width: 100, height: 100)),
            SizedBox(height: 16),
            Text(
              "Welcome",
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

  Widget _buttonsGroup(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 42, right: 42, bottom: 18),
        child: SizedBox(
          child: Column(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
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
        child: FitTextButton("Create account", onPressed: () => {}));
  }

  Widget _loginButton(BuildContext context) {
    return Hero(
      tag: "Login",
      child: FitColorButton(
        "Login",
        onPressed: () => FitnessNavigator.pushLogin(
            context,
            FitnessNavigator.generateRouteForLogin(
                _welcomeScreenViewModel.loginViewModel)),
      ),
    );
  }
}
