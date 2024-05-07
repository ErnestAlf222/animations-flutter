import 'package:animations/widgets/radial_progress.dart';
import 'package:flutter/material.dart';


class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  late double porcent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const  Icon(Icons.refresh_outlined),
        onPressed: () {
         
         setState(() {
          porcent +=10;
          if (porcent > 100) porcent = 0.0;
                  
        });
      },),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
          CustomRadialProgress(porcent: porcent, color: Colors.yellowAccent),
          CustomRadialProgress(porcent: porcent, color: Colors.pinkAccent,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
          CustomRadialProgress(porcent: porcent, color: Colors.greenAccent),
          CustomRadialProgress(porcent: porcent, color: Colors.limeAccent,),
            ],
          ),


        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double porcent;
  final Color color;

  const CustomRadialProgress({
    super.key,
    required this.porcent, 
    required this.color,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,

      child:  RadialProgress( 
        porcentaje : porcent,
        colorPrimario: color,
        colorSecundary: Colors.grey.shade400,
        grosorSecundario: 1.0,
        ),
    
    );
  }
}