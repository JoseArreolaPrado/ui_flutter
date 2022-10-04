import 'package:flutter/material.dart';
import 'package:ui_flutter/main.dart';
import 'package:ui_flutter/src/widgets/radial_progress.dart';

class CircularGraphPage extends StatefulWidget {
  @override
  State<CircularGraphPage> createState() => _CircularGraphPageState();
}

class _CircularGraphPageState extends State<CircularGraphPage> {
  double percentage = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              percentage += 10.0;
              if (percentage > 100) {
                percentage = 0;
              }
            });
          },
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRadialProgress(
                    percentage: percentage,
                    color: Colors.black,
                  ),
                  CustomRadialProgress(
                    percentage: percentage,
                    color: Colors.teal,
                  ),
                ],
              )
            ]));
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    Key? key,
    required this.percentage,
    this.color = Colors.blue,
  }) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 150,
      width: 150,
      child: RadialProgress(
        percentage: percentage,
        arcColor: color,
      ),
    ));
  }
}
