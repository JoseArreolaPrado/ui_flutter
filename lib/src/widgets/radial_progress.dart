import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;

  RadialProgress({this.percentage});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _RadialProgress(widget.percentage),
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {
  final fillPercentage;

  _RadialProgress(this.fillPercentage);

  @override
  void paint(Canvas canvas, Size size) {
    //Full Circle
    final paint = Paint()
      ..strokeWidth = 8
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    //Arc
    final paintArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.teal
      ..style = PaintingStyle.stroke;

    //Fill area
    double arcAngle = 2 * pi * (fillPercentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
