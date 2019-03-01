import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gym_track/configuration/Theme.dart';

const Constraints _defaultConstraints =
    BoxConstraints(minHeight: 40, maxWidth: 350);

class FitTextButton extends StatelessWidget {
  FitTextButton(this._title,
      {titleColor,
      color,
      isUnderscored,
      this.constraints = _defaultConstraints,
      @required this.onPressed})
      : super() {
    this._isUnderscored = isUnderscored ?? true;
    this._titleColor =
        titleColor ?? ApplicationTheme.current.secondaryTextColor;
    this._color = color;
  }

  final String _title;

  Color _titleColor;

  Color _color;

  bool _isUnderscored;

  final VoidCallback onPressed;

  final Constraints constraints;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints,
      child: FlatButton(
        color: _color,
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Container(
                  child: Text(
            _title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                height: 1.2,
                color: _titleColor,
                decoration: _isUnderscored ? TextDecoration.underline : null),
          ))),
        ),
      ),
    );
  }
}

class FitColorButton extends StatelessWidget {
  FitColorButton(this._title,
      {Key key, titleColor, color, constraints, @required this.onPressed})
      : super(key: key) {
    this.titleColor = titleColor ?? ApplicationTheme.current.accentTextColor;
    this.color = color ?? ApplicationTheme.current.mainColor;
    this._constraints = constraints ?? _defaultConstraints;
  }

  String _title;
  Color titleColor;
  Color color;
  VoidCallback onPressed;
  Constraints _constraints;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: _constraints,
      child: RaisedButton(
        child: Container(
          child: Center(
            child: Text(
              _title,
              style: TextStyle(fontSize: 18, color: titleColor),
            ),
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
        onPressed: onPressed,
        color: color,
      ),
    );
  }
}

class ProgressButton extends FitColorButton {
  final Stream<bool> isLoading;

  ProgressButton(title,
      {Key key,
      titleColor,
      color,
      Constraints constraints,
      @required this.isLoading,
      @required onPressed})
      : super(title,
            key: key,
            titleColor: titleColor,
            color: color,
            constraints: constraints,
            onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: _constraints,
      child: StreamBuilder<bool>(
          initialData: false,
          stream: isLoading,
          builder: (context, snapshot) {
            return RaisedButton(
              child: Stack(children: <Widget>[
                snapshot.data
                    ? Container(
                        alignment: Alignment(1, 0.5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  strokeWidth: 2,
                                ),
                              ),
                            ]),
                      )
                    : Container(),
                Center(
                  child: Text(
                    _title,
                    style: TextStyle(fontSize: 18, color: titleColor),
                  ),
                ),
              ]),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30)),
              disabledColor: snapshot.data ? color : null,
              onPressed: snapshot.data ? null : onPressed,
              color: color,
            );
          }),
    );
  }
}
