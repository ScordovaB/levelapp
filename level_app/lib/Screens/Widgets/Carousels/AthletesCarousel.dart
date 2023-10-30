import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselItem.dart';

class AthleteCarouselWidget extends StatefulWidget {
  const AthleteCarouselWidget({super.key});

  @override
  State<AthleteCarouselWidget> createState() => _AthleteCarouselWidget();
}

class _AthleteCarouselWidget extends State<AthleteCarouselWidget> {

  CarouselController? carouselController = CarouselController();
  int carouselCurrentIndex1 = 1;
  int height = 60;
  double heightOut = 80;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 149,
        child: CarouselSlider(
          items: [
            buildItem(
              context,
              'assets/images/Captura_de_pantalla_2023-09-27_161228.png',
              'Courtois',
              false
            ),
            buildItem(
              context,
              'assets/images/Captura_de_pantalla_2023-09-27_151312.png',
              'Kylian Mbappé',
              false
            ),
            buildItem(
              context,
              'assets/images/Captura_de_pantalla_2023-09-27_151259.png',
              'Lionel Messi',
              false
            ),
            buildItem(
              context,
              'assets/images/Captura_de_pantalla_2023-09-27_151243.png',
              'Cristiano Ronaldo',
              false
            ),
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
      ),
    );
  }
}