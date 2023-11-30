import 'package:flutter/material.dart';
import '../Widgets/News/NewsContainer.dart';
import '../Widgets/NextMacthes/NextMacthesColumn.dart';
import 'TeamProfile.dart';
import 'package:level_app/api/news_api.dart';
import 'package:level_app/api/firestore_requests.dart';
import 'package:level_app/models/team_player_model.dart';
import 'package:level_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:level_app/api/users_requests.dart';

class AthleteProfileWidget extends StatefulWidget {
  int id = 0;
  
  AthleteProfileWidget({super.key, required this.id});

  @override
  _AthleteProfileWidgetState createState() => _AthleteProfileWidgetState();
}

class _AthleteProfileWidgetState extends State<AthleteProfileWidget> {

    late Future<User> fetchedUser;
    User user = User(
      userId: "0",
      name: "",
      email: "",
      teams: [],
      players: [],
      profile: "",
      background: 0,
    );
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List _myNews = [];

  
  late Future<Player> futurePlayer;
  Player player = Player(id: 0, name: 'Loading', sport: 'Loading', nationality: 'Loading', photoUrl: "https://i.gifer.com/ZKZg.gif", background: "https://i.gifer.com/ZKZg.gif", teamId: 0);
  Team team = Team(id: 0, name: 'Loading', sport: 'Loading', background: "https://i.gifer.com/ZKZg.gif", profile: "https://i.gifer.com/ZKZg.gif", description: "", nextMatches: []);

  Future<void> setData() async {
    User fetchedUserData = await fetchedUser;
    Player response = await futurePlayer;
    Team response2 = await getTeamById(response.teamId);
    setState(() {
      player = response;
      team = response2;
      user = fetchedUserData;
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

  @override
  void initState() {
    super.initState();
    _loadUserId();
    futurePlayer = getPlayerById(widget.id);
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
                          image: Image.network(
                            player.background,
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
                              player.photoUrl,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                  return Image.network(
                                    'https://as1.ftcdn.net/v2/jpg/02/59/39/46/1000_F_259394679_GGA8JJAEkukYJL9XXFH2JoC3nMguBPNH.jpg',
                                    width: 100,
                                    height: 100,
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
                                    if (user.players.contains(widget.id)) {
                                      removePlayerFromUser(user.userId, widget.id).then((value) {
                                        setState(() {
                                          user.players.remove(widget.id);
                                        });
                                      });
                                    } else {
                                      addPlayerToUser(user.userId, widget.id).then((value) {
                                        setState(() {
                                          user.players.add(widget.id);
                                        });
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: user.players.contains(widget.id)
                                        ? Colors.grey 
                                        : Theme.of(context).hintColor,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    user.players.contains(widget.id) ? 'Following' : 'Follow',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: user.players.contains(widget.id)
                                          ? Colors.white 
                                          : Theme.of(context).scaffoldBackgroundColor,
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
