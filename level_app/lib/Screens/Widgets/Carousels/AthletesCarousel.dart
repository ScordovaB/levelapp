import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselItem.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AthleteCarouselWidget extends StatefulWidget {
  List athletes = [];
  AthleteCarouselWidget({super.key, required this.athletes});

  @override
  State<AthleteCarouselWidget> createState() => _AthleteCarouselWidget();
}

class _AthleteCarouselWidget extends State<AthleteCarouselWidget> {

  CarouselController? carouselController = CarouselController();
  int carouselCurrentIndex1 = 1;
  int height = 60;
  double heightOut = 80;

  List _allAthletes = [];
  List _myAthletes = [];

  Future<void> readJson(List athletes) async {
    final String response = await rootBundle.loadString('assets/testing_data/sport_data.json');
    final data = await json.decode(response);
    setState(() {
      _allAthletes = data["athletes"];
      _myAthletes = getAthletes(athletes, _allAthletes);
    });
    print(_myAthletes);
  }

  List getAthletes(athletes, athletesData){
    List myAthletes = [];
    for (var j = 0; j < athletes.length; j++) {
      for (var i = 0; i < athletesData.length; i++) {
        if(athletes[j] == athletesData[i]["id"]) {
          myAthletes.add(athletesData[i]);
        }
      }
    }
    return myAthletes;
  }

  @override
  void initState() {
    super.initState();
    readJson(widget.athletes);
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
          items:  _myAthletes.map((athlete) {
            return buildItem(
              context,
              athlete['profile'],
              athlete['name'],
              athlete['id'],
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