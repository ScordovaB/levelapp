import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselItem.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:level_app/models/team_player_model.dart';


class TeamCarouselWidget extends StatefulWidget {
  TeamCarouselWidget({super.key, required this.teams});

  List<Team> teams = [];

  @override
  State<TeamCarouselWidget> createState() => _TeamCarouselWidget();
}

class _TeamCarouselWidget extends State<TeamCarouselWidget> {

  CarouselController? carouselController = CarouselController();
  int carouselCurrentIndex1 = 1;
  int height = 60;
  double heightOut = 80;

  List<Team> myTeams = [];

  @override
  void initState() {
    super.initState();
    print(widget.teams.length);
    myTeams = widget.teams;
    print(myTeams.length);
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
          items: myTeams.map((team) {
            return buildItem(
              context,
              team.profile,
              team.name,
              team.id,
              true
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
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
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