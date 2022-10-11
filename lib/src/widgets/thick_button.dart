import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThickButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function() onPress;

  const ThickButton({
    super.key,
    this.icon = Icons.abc,
    required this.text,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(children: [
        _ThickButtonBackground(
          icon: icon,
          color1: color1,
          color2: color2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 140, width: 40),
            FaIcon(icon, color: Colors.white, size: 40),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
            const SizedBox(width: 40),
          ],
        )
      ]),
    );
  }
}

class _ThickButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _ThickButtonBackground({
    required this.icon,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
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
          gradient: LinearGradient(colors: <Color>[
            color1,
            color2,
          ])),
      width: double.infinity,
      height: 100,
    );
  }
}
