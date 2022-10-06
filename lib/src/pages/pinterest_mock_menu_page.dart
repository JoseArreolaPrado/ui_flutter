import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/src/widgets/pinterest_mock_menu_widget.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            _MenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _MenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;
    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: screenWidth,
        child: Align(
          child: PinterestMenu(
            backgroundColor: Colors.white,
            activeColor: Colors.teal,
            show: show,
            items: [
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
            ],
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double lastScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      (controller.offset > lastScroll)
          ? Provider.of<_MenuModel>(context, listen: false).show = false
          : Provider.of<_MenuModel>(context, listen: false).show = true;

      lastScroll = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: controller,
      gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(3, 2),
            QuiltedGridTile(3, 2),
          ]),
      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _PinterestItems(index),
          childCount: items.length),
      // children: List.generate(200, (index) => _PinterestItems(index)),
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

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => _show;
  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}
