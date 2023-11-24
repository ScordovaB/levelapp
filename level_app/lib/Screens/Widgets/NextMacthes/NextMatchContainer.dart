import 'package:flutter/material.dart';

class NextMatchContainer extends StatelessWidget {
  final String date;
  final String team1Image;
  final String team2Image;

  NextMatchContainer({
    required this.date,
    required this.team1Image,
    required this.team2Image,
  });
  // @override
  // void initState() {
  //   print(team1Image);
  //   print(team2Image);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 106,
      decoration: BoxDecoration(
        color: Color(0x419E9B9B),
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(-0.4, -1.17),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 12, // Adjust the font size here
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      team1Image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'VS',
                    style: TextStyle(
                      fontSize: 24, // Adjust the font size here
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      team2Image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.88, -0.08),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent,
                padding: EdgeInsets.symmetric(horizontal: 5),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'More Info',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
