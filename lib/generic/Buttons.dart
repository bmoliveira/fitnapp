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

  bool _isUnderscored;
  bool get isUnderscored {
    return _isUnderscored;
  }

  final VoidCallback onPressed;

  FitTextButton(this._title, {titleColor, color, isUnderscored, this.onPressed})
      : super() {
    this._isUnderscored = isUnderscored ?? true;
    this._titleColor =
        titleColor ?? ApplicationTheme.current.secondaryTextColor;
    this._color = color;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(40),
      child: FlatButton(
        color: color,
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
        child: Center(
            child: Container(
                child: Text(
          _title,
          style: TextStyle(
              fontSize: 12,
              color: titleColor,
              decoration: _isUnderscored ? TextDecoration.underline : null),
        ))),
      ),
    );
  }
}

class FitColorButton extends StatelessWidget {
  String _title;
  Color titleColor;
  Color color;
  VoidCallback onPressed;

  FitColorButton(this._title,
      {Key key, titleColor, color, @required this.onPressed})
      : super(key: key) {
    this.titleColor = titleColor ?? ApplicationTheme.current.accentTextColor;
    this.color = color ?? ApplicationTheme.current.mainColor;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(40),
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
      @required this.isLoading,
      @required onPressed})
      : super(title,
            key: key,
            titleColor: titleColor,
            color: color,
            onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(40),
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
