import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final IconData icon;
  final VoidCallback callback;
 
  PinterestButton({ required this.icon, required this.callback });
}

class PinterestMenu extends StatelessWidget {

   final bool mostrar;

   final Color backgroundColor;
   final Color activeColor;
   final Color inactiveColor;
final List<PinterestButton> items;

  //  final List<PinterestButton> items = [

    // PinterestButton(icon: Icons.pie_chart, callback: () {}),
    // PinterestButton(icon: Icons.search, callback: () {}),
    // PinterestButton(icon: Icons.notifications, callback: () {}),
    // PinterestButton(icon: Icons.supervised_user_circle, callback: () {}),

  // ];

  const PinterestMenu({
    super.key, 
    required this.mostrar, 
    this.backgroundColor = Colors.white, 
    this.activeColor = Colors.black,     //black
    this.inactiveColor = Colors.blueGrey, //blueGrey
    required this.items,
  });


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;

            return _PinterestMenuBackground(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({ required this.child});

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      width: 250,
      height: 60,
      decoration:  BoxDecoration(
        color: backgroundColor,
        borderRadius: const  BorderRadius.all(Radius.circular(100)),
        boxShadow: const <BoxShadow> [
          BoxShadow(
            color: Colors.black38,
            offset:Offset(10,10),
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
      child: child,
    
      
    
    );
  }
}


class _MenuItems extends StatelessWidget {
   final List<PinterestButton> menuItems;
  const _MenuItems( this.menuItems );

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  const _PinterestMenuButton(
    this.index, 
    this.item, 
    
    );

  @override
  Widget build(BuildContext context) {
    
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final menuModel = Provider.of<_MenuModel>(context);
    
    return AnimatedContainer(
      duration: const Duration( milliseconds: 200),
      curve: Curves.bounceIn,
      child: GestureDetector(
        onTap: () {
          Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
          item.callback();
        },
        behavior: HitTestBehavior.translucent,
        child: Icon(
          item.icon,
          size: ( itemSeleccionado == index ) ? 35 : 25,
          color: ( itemSeleccionado == index ) ? menuModel.activeColor : menuModel.inactiveColor,
          ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color backgroundColor = Colors.white;
  Color activeColor     =Colors.black;
  Color inactiveColor   = Colors.blueGrey;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
