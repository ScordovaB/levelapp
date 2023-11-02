import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:level_app/Screens/Home/follow_element.dart';
import 'package:level_app/Screens/Home/home_card.dart';
import 'package:level_app/Screens/Widgets/app_bar_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int _currentPage = 0;

  void _pageListener() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0;
    });
  }

  List _teams = [];
  List _athletes = [];
  List _mainNews = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/testing_data/sport_data.json');
    final data = await json.decode(response);
    setState(() {
      _teams = data["teams"];
      _athletes = data["athletes"];
      //print(_teams);
      //print(_athletes);
    });
  }

  Future<void> readMainNewsJson() async {
    final String response =
        await rootBundle.loadString('assets/testing_data/main_news.json');
    final data = await json.decode(response);
    setState(() {
      _mainNews = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readMainNewsJson();
    readJson();
    _pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          appBar: appBarHome(context),
          key: scaffoldKey,
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // const Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                  //   child: AppBarLevel(),
                  // ),
                  // Divider(
                  //   thickness: 2,
                  //   color: Theme.of(context).colorScheme.primary,
                  // ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                              300, //MediaQuery.sizeOf(context).height * 0.400,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.value ==
                                      0xFF15571f
                                  ? const Color(0xFFD8D8D8)
                                  : Theme.of(context).cardColor,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 8),
                                )
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              )),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.local_fire_department_outlined,
                                    color: Color(0xFFFF5A00),
                                    size: 24,
                                  ),
                                  Text(
                                    'Hot News!',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 3,
                                color: Color(0xFF707070),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 250,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 10),
                                      child: PageView(
                                        controller: _pageController,
                                        scrollDirection: Axis.horizontal,
                                        //reverse: true,
                                        children: [
                                          if (_mainNews.isNotEmpty)
                                            SizedBox(
                                              child: HomeCard(
                                                image: _mainNews[0]["image"],
                                                text: _mainNews[0]["title"],
                                              ),
                                            ),
                                          if (_mainNews.length > 1)
                                            SizedBox(
                                              child: HomeCard(
                                                image: _mainNews[1]["image"],
                                                text: _mainNews[1]["title"],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    //Ejemplo> https://www.youtube.com/watch?v=uPaH7aJZs-M
                                    Positioned(
                                      bottom: 10,
                                      left: 0,
                                      right: 0,
                                      height: 20,
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      _currentPage == 0
                                                          ? Theme.of(context)
                                                              .colorScheme
                                                              .primary
                                                          : Colors.grey,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 5),
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      _currentPage == 1
                                                          ? Theme.of(context)
                                                              .colorScheme
                                                              .primary
                                                          : Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      height: 125, //MediaQuery.sizeOf(context).height * 0.140,
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).primaryColor.value == 0xFF15571f
                                ? const Color(0xFFD8D8D8)
                                : Theme.of(context).cardColor,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 8),
                          )
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Top Athletes:",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).unselectedWidgetColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                                  List.generate(_athletes.length, (index) {
                                String item = _athletes[index]["profile"];
                                return FollowElem(
                                  image: item,
                                  name: _athletes[index]["name"],
                                );
                              }),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      height: 125,
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).primaryColor.value == 0xFF15571f
                                ? const Color(0xFFD8D8D8)
                                : Theme.of(context).cardColor,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 8),
                          )
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Top Teams:",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).unselectedWidgetColor),
                            ),
                          ),
                        ),
                        //Aqui va el sized
                        //CarouselTeams()
                        SizedBox(
                          height: 80,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(_teams.length, (index) {
                                String item = _teams[index]["profile"];
                                return FollowElem(
                                    image: item, name: _teams[index]["name"]);
                              }),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
