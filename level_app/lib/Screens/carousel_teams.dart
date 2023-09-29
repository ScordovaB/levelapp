import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


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
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: height.toDouble(),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://logodownload.org/wp-content/uploads/2021/10/fmf-seleccion-de-mexico-logo-0.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Text(
                'Selección Nacional',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: height.toDouble(),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/en/thumb/d/d6/Rcd_espanyol_logo.svg/1200px-Rcd_espanyol_logo.svg.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Text(
                'RCD Espanyol',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: height.toDouble(),
                clipBehavior: Clip.antiAlias,
                decoration:const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Real_Madrid_CF.svg/1200px-Real_Madrid_CF.svg.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Text(
                'Real Madrid',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: height.toDouble(),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/en/thumb/4/43/Rangers_FC.svg/1200px-Rangers_FC.svg.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Text(
                'Rangers Football Club',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
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
  );

  }
}