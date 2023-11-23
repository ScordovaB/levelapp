import 'package:flutter/material.dart';
import 'package:level_app/Screens/Widgets/app_bar_home.dart';
import 'package:level_app/api/api_service.dart';
import 'package:level_app/api/firestore_requests.dart';
import 'package:level_app/models/event_model.dart';
import 'package:intl/intl.dart';

class EventHome extends StatefulWidget {
  const EventHome({super.key});

  @override
  State<EventHome> createState() => _EventHomeState();
}

class _EventHomeState extends State<EventHome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Event>> events;
  List<Event> finalEvents = [];

  @override
  void initState() {
    super.initState();
    //fetchEventAndStore();
    events = getEvents();
    fetchDataInList();
  }

  Future<void> fetchEventAndStore() async {
    try {
      List<Event> events = await fetchFootballEvents(
          'https://v3.football.api-sports.io/fixtures?league=39&season=2023&round=Regular%20Season%20-%2012');
      await storeFootballEvents(events);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchDataInList() async {
    List<Event> fetchedEvents = await events;

    setState(() {
      //
      finalEvents = fetchedEvents;
      print(finalEvents[0].homeTeam);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: appBarHome(context),
        body: SafeArea(
  top: true,
  child: Column(
    children: [
      Container(
        width: 250,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.value == 0xFF15571f
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
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      SizedBox(height: 13.0),
      Expanded(
        child: ListView.builder(
          itemCount: finalEvents.length,
          itemBuilder: (context, index) {
            final event = finalEvents[index];
            final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(event.timestamp * 1000));

            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 30.0,
                      width: MediaQuery.of(context).size.width / 1.15,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.green,
                          width: 2.0,
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
                          formattedDate,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 90.0,
                  width: MediaQuery.of(context).size.width / 1.15,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.value == 0xFF15571f
                        ? const Color(0xFFD8D8D8)
                        : Theme.of(context).cardColor,
                    border: Border.all(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Image.network(
                            finalEvents[index].leagueImage,
                            height: 90.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Image.network(
                            finalEvents[index].homeTeamImage,
                            height: 60.0,
                            width: 60.0,
                          ),
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
                          child: Image.network(
                            finalEvents[index].awayTeamImage,
                            height: 60.0,
                            width: 60.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ],
  ),
),

      ),
    );
  }
}
