import 'package:animations/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final widthPantalla = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            const PinterestGrid(),
            _PinterestMenuLocation(widthPantalla: widthPantalla),
      
            // body: PinterestMenu(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  
  final double widthPantalla;
  const _PinterestMenuLocation({
    required this.widthPantalla,
  });


  @override
  Widget build(BuildContext context) {

    final mostrar = Provider.of<_MenuModel>(context).mostrar;

    return Positioned(
        bottom: 30,
        child: SizedBox(
          width: widthPantalla,
          child: Align(
            alignment: Alignment.center,
            child: PinterestMenu(
              mostrar: mostrar,
              items: [
                PinterestButton(icon: Icons.pie_chart, callback: () {}),
                PinterestButton(icon: Icons.search, callback: () {}),
                PinterestButton(icon: Icons.notifications, callback: () {}),
                PinterestButton(
                    icon: Icons.supervised_user_circle, callback: () {}),
              ],
            ),
          ),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  ScrollController controller = ScrollController();
  double scrollAnterior   = 0.0; 

  @override
  void initState() {
    super.initState();
    controller.addListener(() {

      if (controller.offset > scrollAnterior && controller.offset > 150 ) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
        
      }else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;

      }
      scrollAnterior = controller.offset;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: controller,
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return Tile(
          index: index,
          extent: (index % 4 + 1) * 100,
        );
      },
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.index,
    required this.extent,
  });
  final int index;
  final double extent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: extent,
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent.shade700,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}


class _MenuModel with ChangeNotifier {

  bool _mostrar = true;

  bool get mostrar => _mostrar;
  set mostrar( bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}