import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  double porcentaje = 10.0;
  double newPorcent = 0.0;

  @override
  void initState() {
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration( milliseconds: 800),
    );

    controller.addListener(() {

      // print('ValorController => ${controller.value}');
      setState(() {
        porcentaje = lerpDouble(porcentaje, newPorcent, controller.value)!;
        
      });

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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: const  Icon( Icons.plus_one),
        onPressed: () {

          porcentaje = newPorcent;
          newPorcent +=10;
          if (newPorcent > 100) {
            newPorcent = 0;
            porcentaje = 0;
            
          }
          controller.forward(from: 0.0 );
          setState(() { });
        },

        ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MyRadialProgress( porcentaje ),
          ),
        ),
      ),
    );
  }
}



class _MyRadialProgress extends CustomPainter {

  // ignore: prefer_typing_uninitialized_variables
  final porcent;
  _MyRadialProgress(this.porcent );

  @override
  void paint(Canvas canvas, Size size) {


    // Circulo completado 
    final paint =  Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey.shade800
      ..style       = PaintingStyle.stroke;

      final center = Offset(size.width * 0.5,  size.height /2 );
      final radio  = min(size.width * 0.5, size.height * 0.5);
      
    // Arco
    final paintArco =  Paint()
      ..strokeWidth = 10
      ..color       = Colors.yellowAccent.shade700
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