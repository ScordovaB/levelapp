import 'package:level_app/Screens/Widgets/Carousels/AthletesCarousel.dart';
import 'package:flutter/material.dart';
import '../Widgets/News/NewsContainer.dart';
import '../Widgets/NextMacthes/NextMacthesColumn.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class TeamProfileWidget extends StatefulWidget {
  int id = 0;
  TeamProfileWidget({super.key, required this.id});

  @override
  _TeamProfileWidgetState createState() => _TeamProfileWidgetState();
}

class _TeamProfileWidgetState extends State<TeamProfileWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List _myTeam = [];
  List _allTeams = [];

  Future<void> readJson(int id) async {
    final String response = await rootBundle.loadString('assets/testing_data/sport_data.json');
    final data = await json.decode(response);
    setState(() {
      _allTeams = data["teams"];
      _myTeam = getTeam(id, _allTeams);
    });
  }

  List getTeam(id, teamsData){
    List myTeams = [];
    for (var i = 0; i < teamsData.length; i++) {
      if(id == teamsData[i]["id"]) {
        myTeams.add(teamsData[i]);
        return myTeams;
      }
    }
    return myTeams;
  }

  @override
  void initState() {
    super.initState();
    readJson(widget.id);
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
                              _myTeam[0]["background"],
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
                              _myTeam[0]["profile"], 
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
                                _myTeam[0]["name"],
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Soccer Team',
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
                NewsContainer(),
                Container(
                  width: double.infinity,
                  height: 258,
                  decoration: const BoxDecoration(),
                  child: NextMatchesColumn(),
                ),
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
                      Expanded(
                        child: AthleteCarouselWidget(athletes: _myTeam[0]["athletes"]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

