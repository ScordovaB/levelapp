import 'package:flutter/material.dart';
import '../Widgets/News/NewsContainer.dart';
import '../Widgets/NextMacthes/NextMacthesColumn.dart';
import 'TeamProfile.dart';
import 'package:level_app/api/news_api.dart';
import 'package:level_app/api/firestore_requests.dart';
import 'package:level_app/models/team_player_model.dart';

class AthleteProfileWidget extends StatefulWidget {
  int id = 0;
  
  AthleteProfileWidget({super.key, required this.id});

  @override
  _AthleteProfileWidgetState createState() => _AthleteProfileWidgetState();
}

class _AthleteProfileWidgetState extends State<AthleteProfileWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List _myNews = [];

  
  late Future<Player> Fplayer;
  Player player = Player(id: 0, name: 'Loading', sport: 'Loading', nationality: 'Loading', photoUrl: "https://i.gifer.com/ZKZg.gif", background: "https://i.gifer.com/ZKZg.gif", teamId: 0);
  Team team = Team(id: 0, name: 'Loading', sport: 'Loading', background: "https://i.gifer.com/ZKZg.gif", profile: "https://i.gifer.com/ZKZg.gif", description: "", nextMatches: []);

  Future<void> setData() async {
    Player response = await Fplayer;
    Team response2 = await getTeamById(response.teamId);
    setState(() {
      player = response;
      team = response2;
      readMainNewsJson(player.name);
    });
    print(_myNews);
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
    Fplayer = getPlayerById(widget.id);
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
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Theme.of(context).textTheme.bodyLarge!.color,
              size: 30,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Athlete Profile',
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
                SizedBox(
                  height: 172,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 124,
                        decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              player.background,
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
                              player.photoUrl, 
                              fit: BoxFit.cover, 
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
                                player.name,
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${player.sport} Player',
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                  Icon(
                                    Icons.sports_soccer,
                                    color: Theme.of(context).hintColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      Navigator.push(
                                        context,
                                          MaterialPageRoute(
                                            builder: (context) => TeamProfileWidget(id: player.teamId,)
                                          ),
                                        );
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        team.profile, 
                                        fit: BoxFit.cover, 
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      Navigator.push(
                                        context,
                                          MaterialPageRoute(
                                            builder: (context) => TeamProfileWidget(id: player.teamId,)
                                          ),
                                        );
                                    },
                                    child: Text(
                                      team.name,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: ElevatedButton(
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 10),
                  child: Text(
                    'Latest News',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if(_myNews.length > 0)
                  NewsContainer(news: _myNews),
                if(_myNews.length == 0)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 10),
                    child: Text(
                      'No news found',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                // Container(
                //   width: double.infinity,
                //   height: 258,
                //   decoration: const BoxDecoration(),
                //   child: NextMatchesColumn(matches: _myTeam[0]["next_matches"], teams: _allTeams),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
