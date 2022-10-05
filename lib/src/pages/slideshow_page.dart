import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/src/widgets/slideshow_widget.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(child: _MySlideShow()),
          Expanded(child: _MySlideShow()),
        ],
      ),
    );
  }
}

class _MySlideShow extends StatelessWidget {
  const _MySlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      dotsOnTop: false,
      dotColor: Colors.blueGrey,
      selectedDotColor: Colors.purpleAccent,
      dotSize: 10,
      dotDiameter: 10,
      dotType: BoxShape.circle,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
