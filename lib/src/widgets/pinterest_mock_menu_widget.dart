import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButtons {
  final Function() onPressed;
  final IconData icon;

  PinterestButtons({
    required this.onPressed,
    required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  PinterestMenu({
    this.show = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.blueGrey,
  });
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
    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
      child: AnimatedOpacity(
        opacity: (show) ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: Builder(builder: (context) {
          Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
          Provider.of<_MenuModel>(context).activeColor = activeColor;
          Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;
          return _MenuBackground(
            child: _MenuItems(items),
          );
        }),
      ),
    );
  }
}

class _MenuBackground extends StatelessWidget {
  final Widget child;
  _MenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: backgroundColor,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              spreadRadius: -5,
            )
          ]),
      child: child,
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
    final selectedIndex = Provider.of<_MenuModel>(context).selectedIndex;
    final activeColor = Provider.of<_MenuModel>(context).activeColor;
    final inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedIndex = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (selectedIndex == index) ? 45 : 25,
          color: (selectedIndex == index) ? activeColor : inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedIndex = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.blue;
  Color inactiveColor = Colors.blueGrey;

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // Color get backgroundColor => _backgroundColor;
  // set backgroundColor(Color color) {
  //   _backgroundColor = color;
  // }

  // Color get activeColor => _activeColor;
  // set activeColor(Color color) {
  //   _activeColor = color;
  // }

  // Color get inactiveColor => _inactiveColor;
  // set inactiveColor(Color color) {
  //   _inactiveColor = color;
  // }
}
