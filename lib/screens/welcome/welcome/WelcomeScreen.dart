import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_track/configuration/AppIcons.dart';
import 'package:gym_track/configuration/Theme.dart';
import 'package:gym_track/screens/welcome/welcome/WelcomeScreenViewModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen(this._welcomeScreenViewModel) : super();

  final WelcomeScreenViewModel _welcomeScreenViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.maxFinite,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          //alignment:new Alignment(x, y)
          children: <Widget>[_logo, _buttonsGroup],
        ),
      ),
    );
  }

  Widget get _logo {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: SvgPicture.asset(AppIcons.AppIconPath,
                  width: 100, height: 100)),
          _emptySpace(16),
          Text(
            "Fitnapp",
            style: TextStyle(
                color: ApplicationTheme.current.textColor,
                fontSize: 20,
                decorationStyle: TextDecorationStyle.double,
                decoration: TextDecoration.combine([])),
          ),
        ],
      ),
    );
  }

  Widget get _buttonsGroup {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 42, right: 42, bottom: 18),
        child: SizedBox(
          child: Column(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[_loginButton, _emptySpace(8), _registerButton],
          ),
        ),
      ),
    );
  }

  Widget get _registerButton {
    return FlatButton(
      color: null,
      onPressed: () => {},
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
      child: Center(
          child: Container(
              child: Text(
        "Create account",
        style: TextStyle(
            color: ApplicationTheme.current.secondaryTextColor,
            decoration: TextDecoration.underline),
      ))),
    );
  }

  Widget get _loginButton {
    return RaisedButton(
      child: Container(
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(color: ApplicationTheme.current.accentColor),
          ),
        ),
      ),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
      onPressed: () => {},
      color: ApplicationTheme.current.textColor,
    );
  }

  Widget _emptySpace(double size) {
    return Container(
      height: size,
    );
  }
}