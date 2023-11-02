import 'package:flutter/material.dart';
import '../Widgets/News/NewsContainer.dart';
import '../Widgets/NextMacthes/NextMacthesColumn.dart';
import 'TeamProfile.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AthleteProfileWidget extends StatefulWidget {
  int id = 0;
  
  AthleteProfileWidget({super.key, required this.id});

  @override
  _AthleteProfileWidgetState createState() => _AthleteProfileWidgetState();
}

class _AthleteProfileWidgetState extends State<AthleteProfileWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List _myAthlete = [];
  List _allAthletes = [];
  List _allTeams = [];
  List _myTeam = [];

  Future<void> readJson(int id) async {
    final String response = await rootBundle.loadString('assets/testing_data/sport_data.json');
    final data = await json.decode(response);
    setState(() {
      _allAthletes = data["athletes"];
      _allTeams = data["teams"];
      _myAthlete = getAthlete(id, _allAthletes);
      _myTeam = getTeam(_myAthlete[0]["team"], _allTeams);
    });
    print(_myTeam);
  }

  List getAthlete(id, athleteData){
    List myTeams = [];
    for (var i = 0; i < athleteData.length; i++) {
      if(id == athleteData[i]["id"]) {
        myTeams.add(athleteData[i]);
        return myTeams;
      }
    }
    return myTeams;
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
                              _myAthlete[0]["background"],
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
                              _myAthlete[0]["profile"], 
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
                                _myAthlete[0]["name"],
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Soccer Player',
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
                                            builder: (context) => TeamProfileWidget(id: _myTeam[0]["id"],)
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
                                        _myTeam[0]["profile"], 
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
                                            builder: (context) => TeamProfileWidget(id: _myTeam[0]["id"],)
                                          ),
                                        );
                                    },
                                    child: Text(
                                      _myTeam[0]["name"],
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
                NewsContainer(),
                Container(
                  width: double.infinity,
                  height: 258,
                  decoration: const BoxDecoration(),
                  child: NextMatchesColumn(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
