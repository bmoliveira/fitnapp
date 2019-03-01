import 'dart:math';

import 'package:flutter/widgets.dart';

/// A ScrollContainer widget upper and lower bounded
///
/// This will fit at maximum its parent's size in order to align views, but also
/// it can be set to a [minWidth] or [minHeight] in order to fit your child inside.
///
/// A basic example usage of this is on the [LoginScreen] where it should fit
/// the whole screen in order to center the logo properly,
/// but when the keyboard appears it needs to be scrollable.
class BoundedSingleChildScrollView extends StatelessWidget {
  BoundedSingleChildScrollView(
      {Key key, this.child, this.minHeight = 0, this.minWidth = 0})
      : super(key: key);

  final Widget child;
  final double minHeight;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                maxWidth: max(constraints.maxWidth, minWidth),
                minHeight: constraints.maxHeight,
                maxHeight: max(constraints.maxHeight, minHeight)),
            child: child,
          ),
        );
      },
    );
  }
}
