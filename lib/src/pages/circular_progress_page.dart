import 'dart:math';

import 'package:flutter/material.dart';

class CirculasProgresBar extends StatefulWidget {
  const CirculasProgresBar({Key? key}) : super(key: key);

  @override
  State<CirculasProgresBar> createState() => _CirculasProgresBarState();
}

class _CirculasProgresBarState extends State<CirculasProgresBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          child: CustomPaint(
            painter: _RadialProgress(),
          ),
        ),
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
