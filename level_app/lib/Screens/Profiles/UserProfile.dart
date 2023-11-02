import 'package:flutter/material.dart'; // Import the Material package
import 'package:level_app/Screens/Profiles/edit_profile.dart';
import 'package:level_app/Screens/settings.dart';
import '../Widgets/Carousels/AthletesCarousel.dart';
import '../Widgets/Carousels/TeamCarousel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List _users = [];
  List _teams = [];
  List _athletes = [];
  Object _myUser = {};

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/testing_data/user_data.json');
    final data = await json.decode(response);
    setState(() {
      _users = data["users"];
      _myUser = _users[0];
      _teams = _users[0]["teams"];
      _athletes = _users[0]["athletes"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
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
            'My Profile',
            style: Theme.of(context).textTheme.titleLarge, 
          ),
          actions: const [],
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
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              _users[0]["background"]
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.00, 1.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 16),
                          child: SizedBox(
                            width: 90,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4, 4, 4, 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  _users[0]["profile"],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Text(
                    _users[0]["name"],
                    style: Theme.of(context).textTheme.headlineMedium, 
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 0, 16),
                  child: Text(
                    _users[0]["email"],
                    style: Theme.of(context).textTheme.headlineSmall,  
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                        onSave: (publicName, bio, email) {
                                          setState(() {
                                            username = publicName;
                                            this.bio = bio;
                                            this.email = email;
                                          });
                                        },
                                      )));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor, 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38),
                          ),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Settings()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38),
                          ),
                        ),
                        child: const Text(
                          'Settings',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
                      child: Text(
                        'Followed Teams',
                        style: Theme.of(context).textTheme.titleSmall, 
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
                        child: SizedBox(
                          width: double.infinity,
                          height: 149,
                          child: TeamCarouselWidget(teams: _teams)
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
                      child: Text(
                        'Followed Athletes',
                        style: Theme.of(context).textTheme.titleSmall, 
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 16, 16),
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
                        child: SizedBox(
                          width: double.infinity,
                          height: 149,
                          child: AthleteCarouselWidget(athletes: _athletes)
                        ),
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
