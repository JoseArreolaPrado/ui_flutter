import 'package:flutter/material.dart';

class AnimationSquarePageMain extends StatelessWidget {
  const AnimationSquarePageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedSquarePage(),
      ),
    );
  }
}

class AnimatedSquarePage extends StatefulWidget {
  const AnimatedSquarePage({Key? key}) : super(key: key);

  @override
  State<AnimatedSquarePage> createState() => _AnimatedSquarePageState();
}

class _AnimatedSquarePageState extends State<AnimatedSquarePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> moveToRight;
  late Animation<double> moveUp;
  late Animation<double> moveToLeft;
  late Animation<double> moveDown;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );

    moveToRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.bounceOut),
      ),
    );
    moveUp = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(.25, .5, curve: Curves.bounceOut),
      ),
    );
    moveToLeft = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(.5, .75, curve: Curves.bounceOut),
      ),
    );
    moveDown = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(.75, 1, curve: Curves.bounceOut),
      ),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
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
        return Transform.translate(
          offset: Offset(moveToRight.value + moveToLeft.value,
              moveUp.value + moveDown.value),
          child: childRectangle,
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
