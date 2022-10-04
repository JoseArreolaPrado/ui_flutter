import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;

  RadialProgress({this.percentage});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double lastPercentage;

  @override
  void initState() {
    lastPercentage = widget.percentage;
    controller = AnimationController(
      vsync: this,
      duration: (const Duration(milliseconds: 200)),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final animationDifference = widget.percentage - lastPercentage;
    lastPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _RadialProgress((widget.percentage - animationDifference) +
                (animationDifference * controller.value)),
          ),
        );
      },
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
