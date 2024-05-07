import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final Color? color1;
  final Color? color2;

  const IconHeader({
      super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.color1 =const Color(0xff526BF6),
      this.color2 = const Color(0xff67ACF2),
      });

  @override
  Widget build(BuildContext context) {
    final Color colorWhite = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        const _IconHeaderBackground(
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2),
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 80, width: double.infinity),
            Text(
              subtitle,
              style: TextStyle(fontSize: 20, color: colorWhite),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                  fontSize: 25, color: colorWhite, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            FaIcon(icon, size: 80, color: Colors.white),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground({required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(94)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color1, color2]),
      ),
    );
  }
}
