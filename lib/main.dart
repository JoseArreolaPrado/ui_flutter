import 'package:flutter/material.dart';
import 'package:ui_flutter/src/pages/slideshow_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design App',
      home: SlideShowPage(),
    );
  }
}
