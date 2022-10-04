import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color arcColor;
  final Color circleColor;
  final double arcStrokeWidth;
  final double circleStrokeWidth;

  RadialProgress({
    required this.percentage,
    this.arcColor = Colors.blue,
    this.circleColor = Colors.grey,
    this.arcStrokeWidth = 10.0,
    this.circleStrokeWidth = 8.0,
  });

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
            painter: _RadialProgress(
                (widget.percentage - animationDifference) +
                    (animationDifference * controller.value),
                widget.arcColor,
                widget.circleColor,
                widget.arcStrokeWidth,
                widget.circleStrokeWidth),
          ),
        );
      },
    );
  }
}

class _RadialProgress extends CustomPainter {
  final fillPercentage;
  final Color arcColor;
  final Color circleColor;
  final double arcStrokeWidth;
  final double circleStrokeWidth;

  _RadialProgress(this.fillPercentage, this.arcColor, this.circleColor,
      this.arcStrokeWidth, this.circleStrokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    //Full Circle
    final paint = Paint()
      ..strokeWidth = circleStrokeWidth
      ..color = circleColor
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    //Arc
    final paintArc = Paint()
      ..strokeWidth = arcStrokeWidth
      ..color = arcColor
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
