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
                child: Center(
                  child: Column(
                    children: [
                      Column(
                        children: [Container(), Container()],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 4.0,
                            ),
                          ),
                          onPressed: () {
                            // Add your onPressed action here
                          },
                          child: const Text('Full Calendar',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25.0)),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 130.0,
                        width: MediaQuery.of(context).size.width / 1.15,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.25),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.emoji_events,
                                size: 40.0,
                              ),
                            ),
                            // Agrega el resto de tus iconos o widgets aquí
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.star,
                                size: 40.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/images/vs.jpg', // Reemplaza con la ruta de tu imagen
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.emoji_events,
                                size: 40.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      )),
    );
  }
}