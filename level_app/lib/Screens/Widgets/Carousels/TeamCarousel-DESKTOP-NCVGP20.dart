import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselItem.dart';

class TeamCarouselWidget extends StatelessWidget {
  final model; 
  const TeamCarouselWidget({super.key, this.model});

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
              'assets/images/fmf-seleccion-de-mexico-logo-1.png',
              'Selección Nacional Mexicana',
              '../TeamProfile/TeamProfile.dart'
            ),
            buildItem(
              context,
              'assets/images/espanyol-logo.png',
              'RCD Espanyol',
              '../TeamProfile/TeamProfile.dart'
            ),
            buildItem(
              context,
              'assets/images/real-madrid-logo.png',
              'Real Madrid',
              '../TeamProfile/TeamProfile.dart'
            ),
            buildItem(
              context,
              'assets/images/rangers-fc-logo.png',
              'Rangers Football Club',
              '../TeamProfile/TeamProfile.dart'
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