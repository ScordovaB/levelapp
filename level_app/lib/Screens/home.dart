import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:level_app/Screens/app_bar.dart';
import 'package:level_app/Screens/carousel_teams.dart';
//import 'package:level_app/Screens/carousel_teams.dart';
import 'package:level_app/Screens/follow_element.dart';
import 'package:level_app/Screens/home_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> teamsImages = [
    "assets/images/sm.png",
    "assets/images/rm.png",
    "assets/images/nyk.png",
  ];
  List<String> athletesImages = [
    "assets/images/neymar1.jpg",
    "assets/images/ronaldo.jpg",
    "assets/images/MESSI.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
            child: AppBarLevel(),
          ),
          Divider(
            thickness: 2,
            color: Theme.of(context).colorScheme.primary,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.sizeOf(context).height * 0.400,
                  decoration: BoxDecoration(
                      color: const Color(0xFFD8D8D8),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 8),
                        )
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 3,
                        color: Color(0xFF707070),
                      ),
                      Expanded(
                          child: SizedBox(
                        width: double.infinity,
                        height: 500,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 10),
                              child: PageView(
                                controller: _pageController,
                                scrollDirection: Axis.horizontal,
                                //reverse: true,
                                children: const [
                                  HomeCard(
                                      image: "assets/images/neymar1.jpg",
                                      text:
                                          "Neymar breaks Pele's record for Brazil!"),
                                  HomeCard(
                                      image: "assets/images/neymar2.jpg",
                                      text:
                                          "Neymar makes his debut for Al-Hilal!"),
                                ],
                              ),
                            ),

                            //CAMBIAR A una LIST>GENERATE>ROWs para que se actulice el indicador
                            //Ejemplo> https://www.youtube.com/watch?v=uPaH7aJZs-M
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              height: 20,
                              child:  Container(
                                child:const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // First Row child
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Color.fromARGB(255, 15, 63, 23),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    // Second Row child
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
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
              height: MediaQuery.sizeOf(context).height * 0.140,
              decoration: const BoxDecoration(
                color: Color(0xFFD8D8D8),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(0, 8),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                shape: BoxShape.rectangle,
              ),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Top Athletes:",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 63, 63, 63)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(athletesImages.length, (index) {
                        String item = athletesImages[index];
                        return FollowElem(image: item);
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
              height: MediaQuery.sizeOf(context).height * 0.150,
              decoration: const BoxDecoration(
                color: Color(0xFFD8D8D8),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(0, 8),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                shape: BoxShape.rectangle,
              ),
              child: const Column(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Top Teams:",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 63, 63, 63)),
                    ),
                  ),
                ),
                //Aqui va el sized
                CarouselTeams()
              ]),
            ),
          )
        ],
      ),
    ));
  }
}
