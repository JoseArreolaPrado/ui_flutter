import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color whiteTranslucid = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        const _IconHeaderBackgroubd(),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(FontAwesomeIcons.plus,
              size: 250, color: Colors.white.withOpacity(0.2)),
        ),
        Column(
          children: <Widget>[
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              'Requested',
              style: TextStyle(
                fontSize: 20,
                color: whiteTranslucid,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Medical support',
              style: TextStyle(
                  fontSize: 25,
                  color: whiteTranslucid,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const FaIcon(FontAwesomeIcons.plus, size: 70, color: Colors.white),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackgroubd extends StatelessWidget {
  const _IconHeaderBackgroubd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff526bf6),
            Color(0xff67acf2),
          ],
        ),
      ),
    );
  }
}
