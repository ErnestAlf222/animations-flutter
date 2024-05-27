


import 'package:animations/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(
      icon: FontAwesomeIcons.slideshare,
      titulo: 'Slideshow',
      page: const SlideshowPage(),
      ),
  _Route(
      icon: FontAwesomeIcons.truckMedical,
      titulo: 'Emergencia',
      page: const EmergencyPage(),
      ),
  _Route(
      icon: FontAwesomeIcons.peopleCarryBox,
      titulo: 'Cuadro animado',
      page: const CuadradoAnimatedPage(),
      ),
  _Route(
      icon: FontAwesomeIcons.circleNotch,
      titulo: 'Barra progreso',
      page: const GraficasCircularesPage(),
      ),
  _Route(
      icon: FontAwesomeIcons.pinterest,
      titulo: 'Pinterest',
      page: const PinterestPage(),
      ),
  _Route(
      icon: FontAwesomeIcons.mobile,
      titulo: 'Slivers',
      page: const SliverListPage(),
      ),
];

class _Route {

final IconData icon;
final String titulo;
final Widget page;

  _Route({required this.icon, required this.titulo, required this.page});


}