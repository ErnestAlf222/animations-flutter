// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'dart:math' as Math;


class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CuadradoAnimado(),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> rotation; 
  late Animation<double> opacidad; 
  late Animation<double> opacidadOut;

  late Animation<double> moveRight; 
  late Animation<double> agrandar; 
  
  @override
  void initState() {
    controller = AnimationController(
      vsync: this, 
      duration: const Duration(
        milliseconds: 4000
      ),
    );
    
    rotation = Tween(begin: .0, end:2 * Math.pi ).animate(
      
      CurvedAnimation(
        parent: controller, 
        curve: Curves.easeOut
      )
    );

    opacidad = Tween( begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.25, 1.0, curve: Curves.easeOut)
      )
    );
    opacidadOut = Tween( begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)
      )
    );

    moveRight = Tween( begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.easeInCirc
      ),
    );
    agrandar = Tween( begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.easeInCirc
      ),
    );


    controller.addListener(() {


      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }

  });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    
    // Play / reproducción
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo ) {

        // print('Status => ${opacidad.value}');
        

        // print('rotación: ' + rotation.value.toString());

        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: childRectangulo
                ),
              ),
            ),
        );
      },
    );
  }
}


class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: const BoxDecoration(
         color: Colors.blueAccent
       ),
     );
   }
}