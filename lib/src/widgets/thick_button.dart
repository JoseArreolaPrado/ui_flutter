import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThickButton extends StatelessWidget {
  const ThickButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _ThickButtonBackground(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(height: 140, width: 40),
          FaIcon(FontAwesomeIcons.carCrash, color: Colors.white, size: 40),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              'Motor accident',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
          SizedBox(width: 40),
        ],
      )
    ]);
  }
}

class _ThickButtonBackground extends StatelessWidget {
  const _ThickButtonBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  FontAwesomeIcons.carCrash,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(4, 6),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(colors: <Color>[
            Color(0xff6989f5),
            Color(0xff906ef5),
          ])),
      width: double.infinity,
      height: 100,
    );
  }
}
