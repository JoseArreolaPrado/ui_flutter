import 'package:flutter/material.dart';
import 'package:ui_flutter/src/pages/animated_square_page.dart';
import 'package:ui_flutter/src/pages/animations_page.dart';
import 'package:ui_flutter/src/pages/headers_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design App',
      home: AnimationSquarePageMain(),
    );
  }
}
