import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final double porcentaje;
  final Color? colorPrimario;
  final Color? colorSecundary;
  final double? grosorSecundario;
   
   const RadialProgress({
    super.key,  
    required this.porcentaje, 
    this.colorPrimario     = Colors.blue, 
    this.colorSecundary    = Colors.grey, 
    this.grosorSecundario  = 4.0,
    });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
      );


    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    controller.forward( from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;


    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
      return Container(
        padding: const  EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _MyRadialProgress(  (widget.porcentaje - diferenciaAnimar ) + ( diferenciaAnimar * controller.value ),
          widget.colorPrimario!,
          widget.colorSecundary!,
          widget.grosorSecundario!
                  
                  
           )
        ),
      );
      },
    );




    
  }
}




class _MyRadialProgress extends CustomPainter {

  // ignore: prefer_typing_uninitialized_variables
  final porcent;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;

  _MyRadialProgress(
    this.porcent, 
    this.colorPrimario, 
    this.colorSecundario, 
    this.grosorSecundario 
    );

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect =   Rect.fromCircle(
      center:const  Offset(0, 0), 
      radius: 180
      );

    const Gradient gradiente =  LinearGradient(
      colors: <Color> [
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Colors.red


    ]);


    // Circulo completado 
    final paint =  Paint()
      ..strokeWidth = grosorSecundario
      ..color       = colorSecundario
      ..strokeCap   = StrokeCap.round
      ..style       = PaintingStyle.stroke;

      final center = Offset(size.width * 0.5,  size.height /2 );
      final radio  = min(size.width * 0.5, size.height * 0.5);
      
    // Arco
    final paintArco =  Paint()
      ..strokeWidth = 15.0
      // ..color       = colorPrimario
      ..shader      = gradiente.createShader(rect)
      ..strokeCap   = StrokeCap.round
      ..style       = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * ( porcent / 100 );
    
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi /2, 
      arcAngle, 
      false, 
      paintArco);


      canvas.drawCircle(center, radio, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}