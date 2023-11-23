import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselItem.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:level_app/models/team_player_model.dart';

class AthleteCarouselWidget extends StatefulWidget {
  AthleteCarouselWidget({super.key, required this.athletes});

  List<Player> athletes = [];
  
  @override
  State<AthleteCarouselWidget> createState() => _AthleteCarouselWidget();
}

class _AthleteCarouselWidget extends State<AthleteCarouselWidget> {

  CarouselController? carouselController = CarouselController();
  int carouselCurrentIndex1 = 1;
  int height = 60;
  double heightOut = 80;

  List<Player> players = [];

  @override
  void initState() {
    super.initState();
    print(widget.athletes.length);
    players = widget.athletes;
    print(players.length);
  }

 @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 149,
        child: CarouselSlider(
          items:  players.map((athlete) {
            return buildItem(
              context,
              athlete.photoUrl,
              athlete.name,
              athlete.id,
              false
            );
          }).toList(),
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