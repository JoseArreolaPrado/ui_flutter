import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_flutter/src/widgets/thick_button.dart';

import '../widgets/icon_header_widget.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ThickButton(
          icon: FontAwesomeIcons.carCrash,
          onPress: () {
            print('Tap');
          },
          color1: const Color(0xff6989f5),
          color2: const Color(0xfff906ef5),
          text: 'Motor Accident',
        ),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
      icon: FontAwesomeIcons.plus,
      subtitle: 'Requested',
      title: 'Medical support',
    );
  }
}
