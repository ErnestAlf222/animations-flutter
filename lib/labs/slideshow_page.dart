import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'package:animations/models/slider_model.dart';


class SlideShowPage extends StatelessWidget {
  
  const SlideShowPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),

      child: const Center(
        child: Column(
          children: [
            Expanded( child:  _Slides() ),
            _Dots()
          ],
        )
        ),
    );
  }
}


class _Dots extends StatelessWidget {
  const _Dots();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 70,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2)
        ],
      ),
    );
  }
}


class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100 ),
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric( horizontal: 7),
      decoration:  BoxDecoration(
        color: ( pageViewIndex >= index - 0.5  && pageViewIndex < index + 0.5) 
              ? Colors.yellowAccent.shade700 
              : Colors.grey,

        shape: BoxShape.circle
      ),
    );
  }
}


class _Slides extends StatefulWidget {

  const _Slides();

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
      Provider.of<SliderModel>(context, listen: false ).currentPage = pageViewController.page!;

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
      children: const [
        
         _Slide('assets/svg/1.svg'),
         _Slide('assets/svg/2.svg'),
         _Slide('assets/svg/4.svg'),
        
    
      ],
    
    
    );
  }
}

class _Slide extends StatelessWidget {
  
  final String svg;
  const _Slide( this.svg );


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg)
    );
  }
}