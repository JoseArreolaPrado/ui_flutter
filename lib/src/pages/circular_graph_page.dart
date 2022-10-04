import 'package:flutter/material.dart';
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
      body: Center(
          child: SizedBox(
        height: 300,
        width: 300,
        child: RadialProgress(
          percentage: percentage,
          arcColor: Colors.orange,
        ),
      )),
    );
  }
}
