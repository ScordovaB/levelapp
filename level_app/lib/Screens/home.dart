import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  "https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Real_Madrid_CF.svg/1200px-Real_Madrid_CF.svg.png",
  "https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/3.png",
  "https://a.espncdn.com/i/teamlogos/mlb/500/nyy.png",
  ];
  List<String> athletesImages = [
  "https://b.fssta.com/uploads/application/soccer/headshots/713.png",
  "https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg",
  "https://www.eltiempo.com/files/image_640_428/files/crop/uploads/2022/09/14/63223c6d05403.r_1666209717285.0-112-1439-832.jpeg",
  ];   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'LEVEL',
                  style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    color: const Color(0xFF707070),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.account_circle,
                      size: 30,
                      color: Color(0xFF707070),
                    ))
              ],
            ),
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
                                  0, 0, 0, 40),
                              child: PageView(
                                controller: _pageController,
                                //scrollDirection: Axis.vertical,
                                //reverse: true,
                                children: const [
                                  HomeCard(
                                      image:
                                          "https://talksport.com/wp-content/uploads/sites/5/2022/11/neymar-brazil-poses-official-fifa-776985045.jpg?w=620",
                                      text:
                                          "Neymar breaks Pele's record for Brazil!"),
                                  HomeCard(
                                      image:
                                          "https://www.infobae.com/new-resizer/IjqQdqPXdwmHWX5qkysdo4Tbdfk=/arc-anglerfish-arc2-prod-infobae/public/PZ6EVVYFKVKIFG27D47IN4DX4Q.jpg",
                                      text:
                                          "Neymar makes his debut for Al-Hilal!"),
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 30,
                                child: IconButton(
                                    onPressed: () {
                                      _pageController.animateToPage(0,
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeInOut);
                                    },
                                    icon: const Icon(
                                        Icons.arrow_back_ios_rounded))),
                            Positioned(
                                bottom: 0,
                                right: 1,
                                child: IconButton(
                                    onPressed: () {
                                      _pageController.animateToPage(1,
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeInOut);
                                    },
                                    icon: const Icon(
                                        Icons.arrow_forward_ios_rounded)))
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.130,
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
                const Text(
                  "Top Athletes:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
              height: MediaQuery.sizeOf(context).height * 0.130,
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
                const Text(
                  "Top Teams:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 60,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(teamsImages.length, (index) {
                        String item = teamsImages[index];
                        return FollowElem(image: item);
                      }),
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    ));
  }
}
