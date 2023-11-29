import 'package:flutter/material.dart';
import 'package:level_app/models/event_model.dart';
import 'NextMatchContainer.dart';
import 'package:intl/intl.dart';

class NextMatchesColumn extends StatefulWidget {
  List<Event> matches = [];
  List teams = [];

  NextMatchesColumn({super.key, required this.matches, required this.teams});

  @override
  _NextMatchesColumnState createState() => _NextMatchesColumnState();
}

class _NextMatchesColumnState extends State<NextMatchesColumn> {
  String getTeam(id,List teams) {
    for (var i = 0; i < teams.length; i++) {
      if (id == teams[i]["id"]) {
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
                    date: DateFormat('dd/MM/yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(match.timestamp * 1000)),  // Adjust based on your Event class properties
                    team1Image: match.homeTeamImage,
                    team2Image: match.awayTeamImage,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
