import 'package:flutter/material.dart';
import 'package:level_app/Screens/Widgets/app_bar_home.dart';

class EventHome extends StatefulWidget {
  const EventHome({super.key});

  @override
  State<EventHome> createState() => _EventHomeState();
}

class LiveEvent {
  final String homeTeam;
  final String homeTeamImage;
  final String awayTeam;
  final String awayTeamImage;
  final String score;

  const LiveEvent(
      {required this.homeTeam,
      required this.homeTeamImage,
      required this.awayTeam,
      required this.awayTeamImage,
      required this.score});
}

class _EventHomeState extends State<EventHome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<LiveEvent> liveEvents = const [
    LiveEvent(
        homeTeam: "NY Yankees",
        homeTeamImage: "homeTeamImage",
        awayTeam: "LA Dodgers",
        awayTeamImage: "awayTeamImage",
        score: "3:1")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          body: GestureDetector(
              child: Scaffold(
            appBar: appBarHome(context),
            key: scaffoldKey,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                  child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.value == 0xFF15571f
                      ? const Color(0xFFD8D8D8)
                      : Theme.of(context).cardColor,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                        child: Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.value ==
                                    0xFF15571f
                                ? const Color(0xFFD8D8D8)
                                : Theme.of(context).cardColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green,
                                offset: Offset(0, 5),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Full Calendar',
                              style: TextStyle(
                                  color: Colors.green[700],
                                  fontSize: 27.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 13.0),
                      Stack(children: [
                        Container(
                          height: 30.0,
                          width: MediaQuery.of(context).size.width / 1.15,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.green, // Color del borde gris
                              width: 2.0, // Grosor del borde
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '30/10/2023 17:00',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ]),
                      Container(
                        height: 90.0,
                        width: MediaQuery.of(context).size.width / 1.15,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.value == 0xFF15571f
                                  ? const Color(0xFFD8D8D8)
                                  : Theme.of(context).cardColor,
                          border: Border.all(
                            color: Colors.green, // Color del borde gris
                            width: 2.0, // Grosor del borde
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/events/copa.png',
                                  height: 90.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/events/arsenal.png',
                                    height: 60.0,
                                    width: 60.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/events/vs.png',
                                  height: 90.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/events/bayern.png',
                                    height: 60.0,
                                    width: 60.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Stack(children: [
                        Container(
                          height: 30.0,
                          width: MediaQuery.of(context).size.width / 1.15,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.green, // Color del borde gris
                              width: 2.0, // Grosor del borde
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '2/11/2023 18:00',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ]),
                      Container(
                        height: 90.0,
                        width: MediaQuery.of(context).size.width / 1.15,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.value == 0xFF15571f
                                  ? const Color(0xFFD8D8D8)
                                  : Theme.of(context).cardColor,
                          border: Border.all(
                            color: Colors.green, // Color del borde gris
                            width: 2.0, // Grosor del borde
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/events/copa.png',
                                  height: 90.0,
                                ),
                              ),
                            ),
                            // Agrega el resto de tus iconos o widgets aquí
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/events/bayern.png',
                                    height: 60.0,
                                    width: 60.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/events/vs.png',
                                  height: 90.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/events/espanyol-logo.png',
                                    height: 60.0,
                                    width: 60.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Stack(children: [
                        Container(
                          height: 30.0,
                          width: MediaQuery.of(context).size.width / 1.15,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.green, // Color del borde gris
                              width: 2.0, // Grosor del borde
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '3/11/2023 18:00',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ]),
                      Container(
                        height: 90.0,
                        width: MediaQuery.of(context).size.width / 1.15,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.value == 0xFF15571f
                                  ? const Color(0xFFD8D8D8)
                                  : Theme.of(context).cardColor,
                          border: Border.all(
                            color: Colors.green, // Color del borde gris
                            width: 2.0, // Grosor del borde
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/events/copa.png',
                                  height: 90.0,
                                ),
                              ),
                            ),
                            // Agrega el resto de tus iconos o widgets aquí
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/events/espanyol-logo.png',
                                    height: 60.0,
                                    width: 60.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/events/vs.png',
                                  height: 90.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/events/real.png',
                                    height: 60.0,
                                    width: 60.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Stack(children: [
                        Container(
                          height: 30.0,
                          width: MediaQuery.of(context).size.width / 1.15,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.green, // Color del borde gris
                              width: 2.0, // Grosor del borde
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '20/11/2023 20:00',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ]),
                      Container(
                        height: 90.0,
                        width: MediaQuery.of(context).size.width / 1.15,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.value == 0xFF15571f
                                  ? const Color(0xFFD8D8D8)
                                  : Theme.of(context).cardColor,
                          border: Border.all(
                            color: Colors.green, // Color del borde gris
                            width: 2.0, // Grosor del borde
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/events/copa.png',
                                  height: 90.0,
                                ),
                              ),
                            ),
                            // Agrega el resto de tus iconos o widgets aquí
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/events/franceTeam.png',
                                    height: 60.0,
                                    width: 60.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/events/vs.png',
                                  height: 90.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/events/kosice.png',
                                    height: 60.0,
                                    width: 60.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Stack(children: [
                        Container(
                          height: 30.0,
                          width: MediaQuery.of(context).size.width / 1.15,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.green, // Color del borde gris
                              width: 2.0, // Grosor del borde
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '30/11/2023 18:00',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ]),
                      Container(
                        height: 90.0,
                        width: MediaQuery.of(context).size.width / 1.15,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.value == 0xFF15571f
                                  ? const Color(0xFFD8D8D8)
                                  : Theme.of(context).cardColor,
                          border: Border.all(
                            color: Colors.green, // Color del borde gris
                            width: 2.0, // Grosor del borde
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/events/copa.png',
                                  height: 90.0,
                                ),
                              ),
                            ),
                            // Agrega el resto de tus iconos o widgets aquí
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/events/fmf-seleccion-de-mexico-logo-1.png',
                                    height: 60.0,
                                    width: 60.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/events/vs.png',
                                  height: 90.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/events/united-states-national-soccer-team-logo.png',
                                    height: 60.0,
                                    width: 60.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.0)
                    ],
                  ),
                ),
              )),
            ),
          )),
        ));
  }
}
