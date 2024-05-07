import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Slideshow extends StatelessWidget {

  final List<Widget>? slides;
  final bool? puntosArriba;
  final Color? colorPrimario;
  final Color? colorSecundario;
  final int?   bulletPrimario;
  final int?   bulletSecundario;

  
  const Slideshow({
    super.key, 
    this.slides, 
    this.puntosArriba     = false, 
    this.colorPrimario    = Colors.blue, 
    this.colorSecundario  = Colors.grey, 
    this.bulletPrimario   = 12, 
    this.bulletSecundario = 12
    });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>  _SlideshowModel(),
      child:   SafeArea(
        child: Center(
          child: Builder(
            builder: (context) {
              Provider.of<_SlideshowModel>(context).colorPrimario   = colorPrimario!;
              Provider.of<_SlideshowModel>(context).colorSecundario = colorSecundario!;


              Provider.of<_SlideshowModel>(context).bulletPrimario = bulletPrimario!;
              Provider.of<_SlideshowModel>(context).bulletSecundario = bulletSecundario!;


              return _CrearEstructuraSlideShow(puntosArriba: puntosArriba, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CrearEstructuraSlideShow extends StatelessWidget {
  const _CrearEstructuraSlideShow({
    required this.puntosArriba,
    required this.slides,
  });

  final bool? puntosArriba;
  final List<Widget>? slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if( puntosArriba! ) 
        _Dots( slides!.length ),
    
    
        Expanded( 
          child: _Slides( slides! 
          ) 
        ),
    
        if( !puntosArriba! ) 
        _Dots( slides!.length ),
      ],
    );
  }
}


class _Dots extends StatelessWidget {
  final int totalSlides;
  

  const _Dots(this.totalSlides, );

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 70,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate( totalSlides, (index) => _Dot(index ) ),
        
      ),
    );
  }
}


class _Dot extends StatelessWidget {
  final int index;
  
  const _Dot( this.index, );

  @override
  Widget build(BuildContext context) {

    final slideShowModel = Provider.of<_SlideshowModel>(context);
    double tamano = 0;
    Color color;

    if(slideShowModel.currentPage >= index - 0.5  && slideShowModel.currentPage < index + 0.5) {
     tamano = slideShowModel.bulletPrimario.toDouble();
     color  = slideShowModel.colorPrimario;

    }else {
      tamano = slideShowModel.bulletSecundario.toDouble();
      color  = slideShowModel.colorSecundario;

    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100 ),
      width: tamano.toDouble(),
      height: tamano.toDouble(),
      margin: const EdgeInsets.symmetric( horizontal: 7),
      decoration:  BoxDecoration(
        color: color,

        shape: BoxShape.circle
      ),
    );
  }
}


class _Slides extends StatefulWidget {

  final List<Widget>  slides;
  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {

      // Actualiar el provider, sliderModel
      Provider.of<_SlideshowModel>(context, listen: false ).currentPage = pageViewController.page!;

    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: pageViewController,
     
      children: widget.slides.map((slide) => _Slide(slide)).toList()
    
    
    );
  }
}

class _Slide extends StatelessWidget {
  
  final Widget slide;
  const _Slide( this.slide  );


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide
    );
  }
}


class _SlideshowModel  with ChangeNotifier {

  double _currentPage      = 0;
  Color  _colorPrimario    = Colors.blue;
  Color  _colorSecundario  = Colors.grey;
  int   _bulletPrimario    = 12;
  int   _bulletSecundario  = 12;

  
  double get currentPage => _currentPage;

  set currentPage( double pagina ) {
    _currentPage = pagina;
    notifyListeners();
    
  }

  // ignore: unnecessary_getters_setters
  Color get colorPrimario => _colorPrimario;
  set colorPrimario( Color color ) {
    _colorPrimario = color;
    
  }

  // ignore: unnecessary_getters_setters
  Color get colorSecundario => _colorSecundario;
  set colorSecundario( Color color ) {
    _colorSecundario = color;
    
  }

  // ignore: unnecessary_getters_setters
  int get bulletPrimario => _bulletPrimario;
  set bulletPrimario( int tamano ) {
    _bulletPrimario = tamano;
    
  }

  // ignore: unnecessary_getters_setters
  int get bulletSecundario => _bulletSecundario;
  set bulletSecundario( int tamano ) {
    _bulletSecundario = tamano;
    
  }

}