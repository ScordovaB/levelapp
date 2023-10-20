import 'package:flutter/material.dart';
import 'package:level_app/Screens/app_bar.dart';

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
          key: scaffoldKey,
          body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                        child: AppBarLevel(),
                      ),
                      Divider(
                        thickness: 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Column(
                        children: [
                          const Text(
                            "WATCH NOW",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            height: 100,
                            decoration: BoxDecoration(
                                color: const Color(0xFFD8D8D8),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                )),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [],
                            ),
                          ),
                          Container()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ),
                          ),
                          onPressed: () {
                            // Add your onPressed action here
                          },
                          child: const Text('Full Calendar'),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      )),
    );
  }
}
