import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselItem.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class TeamCarouselWidget extends StatefulWidget {
  List teams = [];
  TeamCarouselWidget({super.key, required this.teams});

  @override
  State<TeamCarouselWidget> createState() => _TeamCarouselWidget();
}

class _TeamCarouselWidget extends State<TeamCarouselWidget> {

  CarouselController? carouselController = CarouselController();
  int carouselCurrentIndex1 = 1;
  int height = 60;
  double heightOut = 80;

  List _allTeams = [];
  List _myTeams = [];

  Future<void> readJson(List teams) async {
    final String response = await rootBundle.loadString('assets/testing_data/sport_data.json');
    final data = await json.decode(response);
    setState(() {
      _allTeams = data["teams"];
      _myTeams = getTeams(teams, _allTeams);
    });
  }

  List getTeams(teams, teamsData){
    List myTeams = [];
    for (var j = 0; j < teams.length; j++) {
      for (var i = 0; i < teamsData.length; i++) {
        if(teams[j] == teamsData[i]["id"]) {
          myTeams.add(teamsData[i]);
        }
      }
    }
    return myTeams;
  }

  @override
  void initState() {
    super.initState();
    readJson(widget.teams);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 149,
        child: CarouselSlider(
          items: _myTeams.map((team) {
            return buildItem(
              context,
              team['profile'],
              team['name'],
              team['id'],
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