import 'package:flutter/material.dart';

class ThickButton extends StatelessWidget {
  const ThickButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _ThickButtonBackground();
  }
}

class _ThickButtonBackground extends StatelessWidget {
  const _ThickButtonBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
