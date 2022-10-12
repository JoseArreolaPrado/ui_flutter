import 'package:flutter/material.dart';

class SliverPages extends StatelessWidget {
  const SliverPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MainScroll(),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        // const SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text('Hello'),
        // ),
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
              child: Container(
                color: Colors.white,
                child: _Title(),
                alignment: Alignment.centerLeft,
              ),
              maxHeight: 170,
              minHeight: 200,
            )),
        SliverList(delegate: SliverChildListDelegate(items))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  double get minExtent => (maxHeight > minHeight) ? maxHeight : minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minExtent ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text(
            'New',
            style: TextStyle(
              color: Color(0xff532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 100,
            ),
            Positioned(
                bottom: 8,
                child: Container(
                    width: 120, height: 8, color: const Color(0XFFF7CDD5))),
            Container(
              child: const Text(
                'List',
                style: TextStyle(
                  color: Color(0xffd93a30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ListTasks extends StatelessWidget {
  const _ListTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      const _ListItem('Orange', Color(0xffF08F66)),
      const _ListItem('Family', Color(0xffF2A38A)),
      const _ListItem('Subscriptions', Color(0xffF7CDD5)),
      const _ListItem('Books', Color(0xffFCEBAF)),
      const _ListItem('Orange', Color(0xffF08F66)),
      const _ListItem('Family', Color(0xffF2A38A)),
      const _ListItem('Subscriptions', Color(0xffF7CDD5)),
      const _ListItem('Books', Color(0xffFCEBAF)),
    ];

    return ListView.builder(
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;

  const _ListItem(this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
