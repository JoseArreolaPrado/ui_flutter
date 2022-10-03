import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CirculasProgresBar extends StatefulWidget {
  const CirculasProgresBar({Key? key}) : super(key: key);

  @override
  State<CirculasProgresBar> createState() => _CirculasProgresBarState();
}

class _CirculasProgresBarState extends State<CirculasProgresBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double percentage = 10.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    controller.addListener(() {
      // print('Contoller value: ${controller.value}');
      setState(() {
        percentage = lerpDouble(percentage, newPercentage, controller.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.refresh),
        onPressed: () {
          percentage = newPercentage;
          newPercentage += 10;
          if (newPercentage > 100) {
            newPercentage = 0;
            percentage = 0;
          }
          controller.forward(from: 0.0);
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
