import 'package:level_app/Screens/Widgets/Carousels/AthletesCarousel.dart';
import 'package:flutter/material.dart';
import '../Widgets/News/NewsContainer.dart';
import '../Widgets/NextMacthes/NextMacthesColumn.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:level_app/api/news_api.dart';
import 'package:level_app/api/firestore_requests.dart';
import 'package:level_app/models/team_player_model.dart';
import 'package:level_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:level_app/api/users_requests.dart';
  
  class TeamProfileWidget extends StatefulWidget {
    int id = 0;
    TeamProfileWidget({super.key, required this.id,});

    @override
    _TeamProfileWidgetState createState() => _TeamProfileWidgetState();
  }

  class _TeamProfileWidgetState extends State<TeamProfileWidget> {

    late Future<User> fetchedUser;
    User user = User(
      id: "0",
      name: "",
      email: "",
      teams: [],
      players: [],
      profile: "",
      background: 0,
    );

    final scaffoldKey = GlobalKey<ScaffoldState>();
    List _myNews = [];
    
    Team team = Team(id: 0, name: 'Loading', sport: 'Loading', background: "https://i.gifer.com/ZKZg.gif", profile: "https://i.gifer.com/ZKZg.gif", description: "", nextMatches: []);
    late Future<Team> futureTeam;

    late List<Player> players = [];

    Future<void> setData() async {
      User fetchedUserData = await fetchedUser;
      Team response = await futureTeam;
      List<Player> response2 = await getPlayersByTeamId(response.id);
      setState(() {
        team = response;
        players = response2;
        user = fetchedUserData;
        readMainNewsJson(team.name);
      });
    }

    void _loadUserId() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String storedUserId = prefs.getString('userId') ?? '';
      if (storedUserId.isNotEmpty) {
        setState(() {
          fetchedUser = getUserById(storedUserId);
        });
      }
    }

  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedUserId = prefs.getString('userId') ?? '';
    return getUserById(storedUserId);
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
      _loadUserId();
      futureTeam = getTeamById(widget.id);
      getUser().then((User user) {
        setState(() {
          fetchedUser = Future.value(user);
        });

        setData();
      });
      
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
                              image: Image.network(
                                team.background,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      'https://www.qcnews.com/wp-content/uploads/sites/109/2022/09/1040x585-2022-0110-best-size-5-soccer-ball-5a0ad2.jpg',
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.contain,
                                    );
                                  },
                              ).image,
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
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      'https://img.asmedia.epimg.net/resizer/QJBGgqKY4XIpohTFLoA7KMCmaMQ=/1472x1104/cloudfront-eu-central-1.images.arcpublishing.com/diarioas/JULRSPQBN5CF3JDHEYI2INPWQY.jpg',
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.contain,
                                    );
                                  },
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
                                    if (user.teams.contains(widget.id)) {
                                      removeTeamFromUser(user.id, widget.id).then((value) {
                                        setState(() {
                                          user.teams.remove(widget.id);
                                        });
                                      });
                                    } else {
                                      addTeamToUser(user.id, widget.id).then((value) {
                                        setState(() {
                                          user.teams.add(widget.id);
                                        });
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: user.teams.contains(widget.id)
                                        ? Colors.grey 
                                        : Theme.of(context).hintColor,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    user.teams.contains(widget.id) ? 'Following' : 'Follow',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: user.teams.contains(widget.id)
                                          ? Colors.white 
                                          : Theme.of(context).scaffoldBackgroundColor,
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
                // Container(
                //     width: double.infinity,
                //     height: 258,
                //     decoration: const BoxDecoration(),
                //     child: NextMatchesColumn(matches: _myTeam[0]["next_matches"], teams: _allTeams),
                //   ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

