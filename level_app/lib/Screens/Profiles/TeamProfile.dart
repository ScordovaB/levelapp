import 'package:level_app/Screens/Widgets/Carousels/AthletesCarousel.dart';
import 'package:flutter/material.dart';
import '../Widgets/News/NewsContainer.dart';
import '../Widgets/NextMacthes/NextMacthesColumn.dart';

class TeamProfileWidget extends StatefulWidget {
  const TeamProfileWidget({Key? key}) : super(key: key);

  @override
  _TeamProfileWidgetState createState() => _TeamProfileWidgetState();
}

class _TeamProfileWidgetState extends State<TeamProfileWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
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
                  height: 172,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 124,
                        decoration: const BoxDecoration(
                          color: Colors.greenAccent,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1522778034537-20a2486be803?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxyZWFsJTIwbWFkcmlkfGVufDB8fHx8MTY5NTg1MjY0Nnww&ixlib=rb-4.0.3&q=80&w=1080',
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
                            child: Image.asset(
                              'assets/images/real-madrid-logo.png',
                              fit: BoxFit.contain,
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
                                'Real Madrid FC',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Soccer Team',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF3299E7),
                                      fontSize: 18,
                                    ),
                                  ),
                                  Icon(
                                    Icons.sports_soccer,
                                    color: Color(0xFF3299E7),
                                    size: 24,
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                child: const Text(
                                  'Follow',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFF4B39EF),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
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
                        style: Theme.of(context).textTheme.headline6,
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
                        style: Theme.of(context).textTheme.subtitle1,
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
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: AthletesCarouselWidget(),
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

