import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/icon_header_widget.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: IconHeader(
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
      icon: FontAwesomeIcons.plus,
      subtitle: 'Requested',
      title: 'Medical support',
    ));
  }
}
