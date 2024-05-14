import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _MainScroll(),
        const Positioned(
          bottom: -10,
          right: 0,
          child: _ButtonNewList(),
        ),
      ],
    ));
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      height: 100,
      minWidth: size.width * 0.9,
      child: ElevatedButton(
        
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffED6762)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder> (
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
            )
          )
        ),
        child: SizedBox(
           height: size.height * 0.1,
          width: size.width * 0.7,
          child: const Center(
            child:  Text(
              'CREATE NEW LIST',
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 3),
            ),
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = const [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
              minHeight: 170,
              maxHeight: 230,
              child: Container(
                alignment: Alignment.centerLeft,
                color: Colors.white,
                child: const _Title(),
              )),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

// Header => en proceso
class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: const Text(
              'New',
              style: TextStyle(color: Color(0xff532128), fontSize: 40),
            ),
          ),
          Stack(
            children: [
              const SizedBox(width: 100),
              Positioned(
                bottom: 8,
                child: Container(
                  width: 150,
                  height: 8,
                  color: const Color(0xffF7CDD5),
                ),
              ),
              const Text(
                'List',
                style: TextStyle(
                    color: Color(0xffD93A30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class _ListHomeworks extends StatelessWidget {
//   final items = const [
//     _ListItem('Orange', Color(0xffF08F66)),
//     _ListItem('Family', Color(0xffF2A38A)),
//     _ListItem('Subscriptions', Color(0xffF7CDD5)),
//     _ListItem('Books', Color(0xffFCEBAF)),
//     _ListItem('Orange', Color(0xffF08F66)),
//     _ListItem('Family', Color(0xffF2A38A)),
//     _ListItem('Subscriptions', Color(0xffF7CDD5)),
//     _ListItem('Books', Color(0xffFCEBAF)),
//   ];
//   const _ListHomeworks();

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: items.length, itemBuilder: (context, index) => items[index]);
//   }
// }

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;
  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 130,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Text(
        titulo,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.normal, fontSize: 25),
      ),
    );
  }
}
