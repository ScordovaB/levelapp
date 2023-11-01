import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:level_app/Screens/Profiles/UserProfile.dart';
import 'package:level_app/Screens/Home/follow_element.dart';
import 'package:level_app/Screens/Home/home_card.dart';
import 'package:level_app/Screens/Widgets/app_bar_home.dart';
//import 'package:level_app/Screens/Widgets/Carousels/TeamCarousel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> teamsImages = [
    "assets/images/sm.png",
    "assets/images/rm.png",
    "assets/images/nyk.png",
    "assets/images/rangers-fc-logo.png",
    "assets/images/espanyol-logo.png",
  ];
  List<List<String>> teamsNames = [
    ["Seleccion Mexicana", "assets/images/sm.png"],
    ["Real Madrid", "assets/images/rm.png"],
    [
      "NY Yankees",
      "assets/images/nyk.png",
    ],
    [
      "Rangers FC",
      "assets/images/rangers-fc-logo.png",
    ],
    [
      "Espanyol",
      "assets/images/espanyol-logo.png",
    ]
  ];

  List<String> athletesImages = [
    "assets/images/neymar1.jpg",
    "assets/images/ronaldo.jpg",
    "assets/images/MESSI.jpeg",
    "assets/images/Captura_de_pantalla_2023-09-27_161228.png",
    "assets/images/Captura_de_pantalla_2023-09-27_161300.png"
  ];
  List<List<String>> athletesNames = [
    [
      "Neymar Jr",
      "assets/images/neymar1.jpg",
    ],
    [
      "Cristiano Ronaldo",
      "assets/images/ronaldo.jpg",
    ],
    [
      "Messi",
      "assets/images/MESSI.jpeg",
    ],
    [
      "Courtois",
      "assets/images/Captura_de_pantalla_2023-09-27_161228.png",
    ],
    ["Modric", "assets/images/Captura_de_pantalla_2023-09-27_161300.png"]
  ];

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
                                        children: const [
                                          SizedBox(
                                            child: HomeCard(
                                                image:
                                                    "assets/images/neymar1.jpg",
                                                text:
                                                    "Neymar breaks Pele's record for Brazil!"),
                                          ),
                                          SizedBox(
                                            child: HomeCard(
                                                image:
                                                    "assets/images/neymar2.jpg",
                                                text:
                                                    "Neymar makes his debut for Al-Hilal!"),
                                          ),
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
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // First Row child
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            // Second Row child
                                            const Row(
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
                                  List.generate(athletesImages.length, (index) {
                                String item = athletesImages[index];
                                return FollowElem(
                                  image: item,
                                  list: athletesNames[index],
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
                              children:
                                  List.generate(teamsImages.length, (index) {
                                String item = teamsImages[index];
                                return FollowElem(
                                    image: item, list: teamsNames[index]);
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
