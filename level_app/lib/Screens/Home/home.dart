import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:level_app/Screens/Home/follow_element.dart';
import 'package:level_app/Screens/Home/home_card.dart';
import 'package:level_app/Screens/Widgets/app_bar_home.dart';
import 'package:level_app/api/news_api.dart';
import 'package:level_app/api/firestore_requests.dart';
import 'package:level_app/models/team_player_model.dart';
import 'package:level_app/models/user_model.dart';
import 'package:level_app/api/users_requests.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int _currentPage = 0;

  void _pageListener() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0;
    });
  }

  List _mainNews = [];

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

  late Future<List<Team>> teams;
  late Future<List<Player>> players;
  List<Team> fetchedTeams = [];
  List<Player> fetchedPlayers = [];

  Future<void> setData() async {
    User fetchedUserData = await fetchedUser;
    List<Team> t = await teams;
    List<Player> p = await players;
    setState(() {
      user = fetchedUserData;
      fetchedTeams = t;
      fetchedPlayers = p;
    });
  }

  Future<void> readMainNewsJson() async {
    final List response = await fetchNews();
    setState(() {
      _mainNews = response;
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

  @override
  void initState() {
    super.initState();
    _loadUserId();
    readMainNewsJson();
    teams = getTeams();
    players = getPlayers(limit: 5);

    getUser().then((User user) {
      setState(() {
        fetchedUser = Future.value(user);
      });
      setData();
    });

    _pageController.addListener(_pageListener);
  }

  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedUserId = prefs.getString('userId') ?? '';
    return getUserById(storedUserId);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: appBarHome(context, user.name),
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
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
                                      children: [
                                        if (_mainNews.isNotEmpty)
                                          SizedBox(
                                            child: HomeCard(
                                              image: _mainNews[0]["urlToImage"],
                                              text: _mainNews[0]["title"],
                                              date: _mainNews[0]["publishedAt"],
                                              externalLink:
                                                  _mainNews[0]["url"],
                                            ),
                                          ),
                                        if (_mainNews.length > 1)
                                          SizedBox(
                                            child: HomeCard(
                                              image: _mainNews[1]["urlToImage"],
                                              text: _mainNews[1]["title"],
                                              date: _mainNews[1]["publishedAt"],
                                              externalLink:
                                                  _mainNews[1]["url"],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: 0,
                                    right: 0,
                                    height: 20,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 5,
                                              backgroundColor:
                                                  _currentPage == 0
                                                      ? Theme.of(context)
                                                          .colorScheme
                                                          .primary
                                                      : Colors.grey,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 5),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 5,
                                              backgroundColor:
                                                  _currentPage == 1
                                                      ? Theme.of(context)
                                                          .colorScheme
                                                          .primary
                                                      : Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ],
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
                    height: 125,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.value == 0xFF15571f
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
                                color: Theme.of(context)
                                    .unselectedWidgetColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              fetchedPlayers.length,
                              (index) {
                                String item = fetchedPlayers[index].photoUrl;
                                return FollowElem(
                                  image: item,
                                  name: fetchedPlayers[index].name,
                                  id: fetchedPlayers[index].id,
                                  team: false,
                                );
                              },
                            ),
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
                      color: Theme.of(context).primaryColor.value == 0xFF15571f
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
                                color: Theme.of(context)
                                    .unselectedWidgetColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              fetchedTeams.length,
                              (index) {
                                String item = fetchedTeams[index].profile;
                                return FollowElem(
                                  image: item,
                                  name: fetchedTeams[index].name,
                                  id: fetchedTeams[index].id,
                                  team: true,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
