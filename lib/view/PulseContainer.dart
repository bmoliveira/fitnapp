import 'package:flutter/material.dart';
import 'package:gym_track/view/CircleSpritePainter.dart';

class PulseContainer extends StatefulWidget {
  Color color;
  Widget child;

  PulseContainer({Key key, this.color, this.child})
      : assert(color != null, child != null),
        super();

  @override
  PulseContainerState createState() => new PulseContainerState(color, child);
}

class PulseContainerState extends State<PulseContainer>
    with SingleTickerProviderStateMixin {
  Color color;
  Widget child;

  PulseContainerState(this.color, this.child) : super();

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  void stopAnimation() {
    _controller.stop();
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      painter: CircleSpritePainter(_controller, color),
      child: child,
    );
  }
}
