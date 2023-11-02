import 'package:flutter/material.dart'; // Import the Material package
import 'package:level_app/Screens/Profiles/edit_profile.dart';
import 'package:level_app/Screens/settings.dart';
import '../Widgets/Carousels/AthletesCarousel.dart';
import '../Widgets/Carousels/TeamCarousel.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String username = 'Andrew D.';
  String bio = '';
  String email = 'andrew@domainname.com';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
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
            style: Theme.of(context).textTheme.headline6,
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
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 140,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1444090695923-48e08781a76a?w=1280&h=720',
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.00, 1.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 0, 0, 16),
                          child: Container(
                            width: 90,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4, 4, 4, 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1536084006720-6c105926e135?w=1280&h=720',
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
                    username,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 0, 16),
                  child: Text(
                    email,
                    style: TextStyle(fontSize: 15),
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
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38),
                          ),
                        ),
                        child: Text(
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
                        child: Text(
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
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      child: Text(
                        'See all',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFB4B39EF),
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
                        child: Container(
                            width: double.infinity,
                            height: 149,
                            child: const TeamCarouselWidget()),
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
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 16, 16),
                      child: Text(
                        'See all',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFB4B39EF),
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
                        child: Container(
                            width: double.infinity,
                            height: 149,
                            child: const AthleteCarouselWidget()),
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
