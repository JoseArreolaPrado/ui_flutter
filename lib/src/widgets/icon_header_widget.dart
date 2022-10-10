import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  const IconHeader({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    Color whiteTranslucid = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackgroubd(
          color1: this.color1,
          color2: this.color2,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(this.icon,
              size: 250, color: Colors.white.withOpacity(0.2)),
        ),
        Column(
          children: <Widget>[
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              this.subtitle,
              style: TextStyle(
                fontSize: 20,
                color: whiteTranslucid,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              this.title,
              style: TextStyle(
                  fontSize: 25,
                  color: whiteTranslucid,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            FaIcon(this.icon, size: 70, color: Colors.white),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackgroubd extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _IconHeaderBackgroubd({
    Key? key,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            this.color1,
            this.color2,
          ],
        ),
      ),
    );
  }
}
