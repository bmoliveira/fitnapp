import 'package:flutter/material.dart';
import 'package:gym_track/configuration/Theme.dart';

class FitTextButton extends StatelessWidget {
  final String _title;
  Color get titleColor {
    return _titleColor;
  }

  Color _titleColor;

  Color get color {
    return _color;
  }

  Color _color;

  final VoidCallback onPressed;

  FitTextButton(this._title, {titleColor, color, this.onPressed}) : super() {
    this._titleColor = titleColor ?? ApplicationTheme.current.secondaryTextColor;
    this._color = color;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      onPressed: onPressed,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
      child: Center(
          child: Container(
              child: Text(
        _title,
        style:
            TextStyle(color: titleColor, decoration: TextDecoration.underline),
      ))),
    );
  }
}

class FitColorButton extends StatelessWidget {
  String _title;
  Color titleColor;
  Color color;
  VoidCallback onPressed;

  FitColorButton(this._title, {titleColor, color, @required this.onPressed})
      : super() {
    this.titleColor = titleColor ?? ApplicationTheme.current.accentTextColor;
    this.color = color ?? ApplicationTheme.current.mainColor;
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Container(
        child: Center(
          child: Text(
            _title,
            style: TextStyle(color: titleColor),
          ),
        ),
      ),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
      onPressed: onPressed,
      color: color,
    );
  }
}
