import 'dart:math';

import 'package:flutter/material.dart';

class CirculasProgresBar extends StatefulWidget {
  const CirculasProgresBar({Key? key}) : super(key: key);

  @override
  State<CirculasProgresBar> createState() => _CirculasProgresBarState();
}

class _CirculasProgresBarState extends State<CirculasProgresBar> {
  double percentage = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.refresh),
        onPressed: () {
          percentage += 10;
          if (percentage > 100) {
            percentage = 0;
          }
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _RadialProgress(percentage),
          ),
        ),
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
