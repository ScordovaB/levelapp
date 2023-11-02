import 'package:flutter/material.dart';
import 'NextMatchContainer.dart';

class NextMatchesColumn extends StatefulWidget {
  List matches = [];
  List teams = [];

  NextMatchesColumn({super.key, required this.matches, required this.teams});

  @override
  _NextMatchesColumnState createState() => _NextMatchesColumnState();
}

class _NextMatchesColumnState extends State<NextMatchesColumn> {

  String getTeam(id, teams){
    for (var i = 0; i < teams.length; i++) {
      if(id == teams[i]["id"]) {
        return teams[i]["profile"];
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 10),
                child: Text(
                  'Next Matches',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
              child: Text(
                'See all',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).hintColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var match in widget.matches)
                  NextMatchContainer(
                    date: match['date'],
                    team1Image: getTeam(match["home_team"], widget.teams),
                    team2Image: getTeam(match["away_team"], widget.teams),
                  ),              ],
            ),
          ),
        ),
      ],
    );
  }
}
