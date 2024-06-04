import 'package:animations/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../config/theme/app_theme.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: const Column(
        children: [
           Expanded(child: MiSlideShow()),
           Expanded(child: MiSlideShow()),
        ],
      )
      
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.themeNow.colorScheme.secondary;

    return Slideshow(
      bulletPrimario   : 15,
      bulletSecundario : 12,
      puntosArriba: false,
      colorPrimario: (appTheme.darkTheme) ? accentColor : Colors.amber  ,
      colorSecundario: Colors.grey,
      slides: [
    
        SvgPicture.asset('assets/svg/2.svg'),
        SvgPicture.asset('assets/svg/1.svg'),
        SvgPicture.asset('assets/svg/4.svg'),
        SvgPicture.asset('assets/svg/5.svg'),
        SvgPicture.asset('assets/svg/6.svg'),
       
      ],
    );
  }
}