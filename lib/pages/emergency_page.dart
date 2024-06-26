import 'package:animate_do/animate_do.dart';
import 'package:animations/widgets/button_big.dart';
import 'package:animations/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}


class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {

    final items = <ItemBoton>[
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeIn(
              duration: const Duration(milliseconds: 250),
              child: ButtonBig(
                  icon: item.icon,
                  texto: item.texto,
                  color1: item.color1,
                  color2: item.color2,
                  onPress: () {}),
            ))
        .toList(); 


    return   Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only( top: 200),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children:  [
                const SizedBox( height: 80),
                ...itemMap
                
            
              ],
            ),
          ),
          const _Header(),
        ],
      )
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia médica',
          subtitle: 'Haz solicitado',
          color1: Color(0xff536CF6),
          color2: Color(0xff66A9F2),
        ),
        Positioned(
          right: 0,
          top: 55,
          child: RawMaterialButton(
            padding: const EdgeInsets.all(15),
            shape: const CircleBorder(),
            onPressed: () {},
            child: const FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}


class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitle: 'Haz solicitado',
      title: 'Asistencia médica',
    
    );
  }
}