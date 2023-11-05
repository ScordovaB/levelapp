import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:level_app/Screens/Widgets/Carousels/CarouselItem.dart';

class CarouselTeams extends StatefulWidget {
  const CarouselTeams({super.key});

  @override
  State<CarouselTeams> createState() => _CarouselTeamsState();
}

class _CarouselTeamsState extends State<CarouselTeams> {
  CarouselController? carouselController = CarouselController();
  int carouselCurrentIndex1 = 1;
  int height = 60;
  double heightOut = 80;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: heightOut,
      child: CarouselSlider(
        items: [
          // buildItem(context, 'assets/images/fmf-seleccion-de-mexico-logo-1.png',
          //     'Selección Nacional Mexicana', true),
          // buildItem(
          //     context, 'assets/images/espanyol-logo.png', 'RCD Espanyol', true),
          // buildItem(context, 'assets/images/real-madrid-logo.png',
          //     'Real Madrid', true),
          // buildItem(context, 'assets/images/rangers-fc-logo.png',
          //     'Rangers Football Club', true),
        ],
        carouselController: carouselController,
        options: CarouselOptions(
          initialPage: 1,
          viewportFraction: 0.3,
          disableCenter: true,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayInterval: Duration(milliseconds: 6000),
          autoPlayCurve: Curves.linear,
          pauseAutoPlayInFiniteScroll: true,
          onPageChanged: (index, _) => carouselCurrentIndex1 = index,
        ),
      ),
    );
  }
}
