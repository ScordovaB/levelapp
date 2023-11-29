  import 'package:level_app/Screens/Widgets/Carousels/AthletesCarousel.dart';
  import 'package:flutter/material.dart';
import 'package:level_app/models/event_model.dart';
  import '../Widgets/News/NewsContainer.dart';
  import '../Widgets/NextMacthes/NextMacthesColumn.dart';
  import 'package:flutter/services.dart' show rootBundle;
  import 'dart:convert';
  import 'package:level_app/api/news_api.dart';
  import 'package:level_app/api/firestore_requests.dart';
  import 'package:level_app/models/team_player_model.dart';

  class TeamProfileWidget extends StatefulWidget {
    int id = 0;
    TeamProfileWidget({super.key, required this.id});

    @override
    _TeamProfileWidgetState createState() => _TeamProfileWidgetState();
  }

  class _TeamProfileWidgetState extends State<TeamProfileWidget> {

    final scaffoldKey = GlobalKey<ScaffoldState>();
    List _myNews = [];
    late List<Event> teamEvents = [];

    
    Team team = Team(id: 0, name: 'Loading', sport: 'Loading', background: "https://i.gifer.com/ZKZg.gif", profile: "https://i.gifer.com/ZKZg.gif", description: "", nextMatches: []);
    late Future<Team> futureTeam;

    late List<Player> players = [];

    Future<void> setData() async {
      Team response = await futureTeam;
      List<Player> response2 = await getPlayersByTeamId(response.id);
      List<Event> teamEventsResponse = await getEventsForTeam(response.id);
      setState(() {
        team = response;
        players = response2;
        teamEvents = teamEventsResponse;
        readMainNewsJson(team.name);
      });
    }

    Future<void> readMainNewsJson(name) async {
      final List response = await fetchSpecificNews(name);  
      setState(() {
        _myNews = response;
      });
    }

    @override
    void initState() {
      super.initState();
      futureTeam = getTeamById(widget.id);
      setData();
      
    }

    @override
    void dispose() {

      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Team Profile',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 172,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 124,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                team.background,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.01, 0.83),
                          child: Container(
                            width: 139,
                            height: 139,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                team.profile, 
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.00, 0.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  team.name,
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${team.sport} Team',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Theme.of(context).primaryColorLight,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Icon(
                                      Icons.sports_soccer,
                                      color: Theme.of(context).primaryColorLight,
                                      size: 24,
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context).hintColor,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Follow',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 10),
                        child: Text(
                          'Latest News',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                  NewsContainer(news: _myNews),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
                        child: Text(
                          'Athletes',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: Text(
                          'See all',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 141,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if(players.isNotEmpty)
                          AthleteCarouselWidget(athletes: players), 
                        if(players.isEmpty)
                          Text('Loading...')
                      ],
                    ),
                  ),
                Container(
                    width: double.infinity,
                    height: 258,
                    decoration: const BoxDecoration(),
                    child: NextMatchesColumn(matches: teamEvents, teams:[]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

