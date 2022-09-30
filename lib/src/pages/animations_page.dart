import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> rotation;
  late Animation<double> opacity;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInBack),
    );

    opacity = Tween(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeOut),
      ),
    );

    controller.addListener(() {
      print('Status ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.reset();
      }
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
    //Play
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (BuildContext context, Widget? childRectangle) {
        return Transform.rotate(
          angle: rotation.value,
          child: Opacity(opacity: opacity.value, child: childRectangle),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
