import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ui_flutter/src/widgets/pinterest_mock_menu_widget.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(child: PinterestGrid()),
          _MenuLocation(),
        ],
      ),
    );
  }
}

class _MenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: screenWidth,
        child: Align(
          child: PinterestMenu(),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      crossAxisSpacing: 4,
      children: List.generate(200, (index) => _PinterestItems(index)),
    );
  }
}

class _PinterestItems extends StatelessWidget {
  final int index;

  const _PinterestItems(this.index);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: index.isEven ? 2 : 3,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.blue),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ),
      ),
    );
  }
}
