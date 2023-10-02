import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselItem.dart';

class AthletesCarouselWidget extends StatelessWidget {
  final model; 
  const AthletesCarouselWidget({super.key, this.model});

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
              'assets/images/Captura_de_pantalla_2023-09-27_151324.png',
              'LeBron James',
              '../AthleteProfile/AthleteProfile.dart'
            ),
            buildItem(
              context,
              'assets/images/Captura_de_pantalla_2023-09-27_151312.png',
              'Kylian Mbappé',
              '../AthleteProfile/AthleteProfile.dart'
            ),
            buildItem(
              context,
              'assets/images/Captura_de_pantalla_2023-09-27_151259.png',
              'Lionel Messi',
              '../AthleteProfile/AthleteProfile.dart'
            ),
            buildItem(
              context,
              'assets/images/Captura_de_pantalla_2023-09-27_151243.png',
              'Cristiano Ronaldo',
              '../AthleteProfile/AthleteProfile.dart'
            ),
          ],
          carouselController: model.carouselController1 ??= CarouselController(),
          options: CarouselOptions(
            initialPage: 1,
            viewportFraction: 0.3,
            disableCenter: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayInterval: const Duration(milliseconds: 6000),
            autoPlayCurve: Curves.linear,
            pauseAutoPlayInFiniteScroll: true,
            onPageChanged: (index, _) => model.carouselCurrentIndex1 = index,
          ),
        ),
      ),
    );
  }
}