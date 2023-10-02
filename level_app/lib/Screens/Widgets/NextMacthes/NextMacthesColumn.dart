import 'package:flutter/material.dart';
import 'NextMatchContainer.dart';

class NextMatchesColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 10),
                child: Text(
                  'Next Matches',
                  style: TextStyle(
                    fontSize: 24, // Adjust the font size here
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
              child: Text(
                'See all',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16, // Adjust the font size here
                  color: Color(0xFB4B39EF),
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
                NextMatchContainer(
                  date: 'Sat, 30/9 10:30',
                  team1Image: 'assets/images/real-madrid-logo.png',
                  team2Image: 'assets/images/espanyol-logo.png',
                ),
                SizedBox(height: 15), 
                NextMatchContainer(
                  date: 'Mar, 3/10 10:30',
                  team1Image: 'assets/images/rangers-fc-logo.png',
                  team2Image: 'assets/images/real-madrid-logo.png',
                ),
                SizedBox(height: 15), 
                NextMatchContainer(
                  date: 'Sat, 30/9 10:30',
                  team1Image: 'assets/images/real-madrid-logo.png',
                  team2Image: 'assets/images/espanyol-logo.png',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}