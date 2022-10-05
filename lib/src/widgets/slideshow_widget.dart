import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsOnTop;
  final Color dotColor;
  final Color selectedDotColor;
  final BoxShape dotType;
  final double dotSize;
  final double dotDiameter;

  SlideShow(
      {required this.slides,
      this.dotsOnTop = false,
      this.dotColor = Colors.grey,
      this.selectedDotColor = Colors.blue,
      this.dotType = BoxShape.circle,
      this.dotSize = 50,
      this.dotDiameter = 10});

  @override
  Widget build(BuildContext context) {
    // Provider.of<_SliderModel>(context).dotColor = this.dotColor;
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(),
      child: SafeArea(
        child: Center(
          child: Builder(builder: (BuildContext context) {
            Provider.of<_SliderModel>(context).dotColor = dotColor;
            Provider.of<_SliderModel>(context).selectedDotColor =
                selectedDotColor;
            Provider.of<_SliderModel>(context).dotDiameter = dotDiameter;
            Provider.of<_SliderModel>(context).dotSize = dotSize;
            Provider.of<_SliderModel>(context).dotType = dotType;
            return Column(
              children: <Widget>[
                if (dotsOnTop) _Dots(slides.length),
                Expanded(
                  child: _Slides(
                    slides,
                  ),
                ),
                if (!dotsOnTop) _Dots(slides.length),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int slidesCounter;

  _Dots(this.slidesCounter);

  @override
  Widget build(BuildContext context) {
    final sliderModel = Provider.of<_SliderModel>(context);
    return SizedBox(
      width: double.infinity,
      height: sliderModel.dotSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(slidesCounter, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final sliderModel = Provider.of<_SliderModel>(context);

    return AnimatedContainer(
      width: sliderModel.dotDiameter,
      height: sliderModel.dotDiameter,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (sliderModel.currentPage >= index - 0.5 &&
                sliderModel.currentPage < index + 0.5)
            ? sliderModel.selectedDotColor
            : sliderModel.dotColor,
        shape: sliderModel.dotType,
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(50),
      child: slide,
    );
  }
}

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color dotColor = Colors.grey;
  Color selectedDotColor = Colors.blue;
  BoxShape dotType = BoxShape.circle;
  double dotSize = 50;
  double dotDiameter = 10;

  double get currentPage => _currentPage;
  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
