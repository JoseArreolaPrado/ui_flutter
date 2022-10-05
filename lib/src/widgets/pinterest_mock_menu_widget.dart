import 'package:flutter/material.dart';

class PinterestButtons {
  final Function() onPressed;
  final IconData icon;

  PinterestButtons({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButtons> items = [
    PinterestButtons(
        onPressed: () {
          print('Icon 1');
        },
        icon: Icons.pie_chart),
    PinterestButtons(
        onPressed: () {
          print('Icon 2');
        },
        icon: Icons.search),
    PinterestButtons(
        onPressed: () {
          print('Icon 3');
        },
        icon: Icons.notifications),
    PinterestButtons(
        onPressed: () {
          print('Icon 4');
        },
        icon: Icons.supervised_user_circle),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _MenuBackground(),
    );
  }
}

class _MenuBackground extends StatelessWidget {
  final Widget child;
  _MenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              spreadRadius: -5,
            )
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButtons> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(menuItems.length,
            (index) => _PinterestMenuButton(index, menuItems[index])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButtons item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: 25,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
