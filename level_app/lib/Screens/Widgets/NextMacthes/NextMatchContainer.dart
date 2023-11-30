import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class NextMatchContainer extends StatelessWidget {
  final String date;
  final String team1Image;
  final String team2Image;
  final String teamName1;
  final String teamName2;

  NextMatchContainer({
    required this.date,
    required this.team1Image,
    required this.team2Image,
    required this.teamName1,
    required this.teamName2,
  });
  // @override
  // void initState() {
  //   print(team1Image);
  //   print(team2Image);
  // }
  Future<void> _launchURL(String url) async {
  try {
    await launcher.launchUrl(Uri.parse(url));
  } catch (e) {
    print('Error launching URL: $e');
  }
}
  

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
            alignment: const AlignmentDirectional(0.88, -0.08),
            child: ElevatedButton(
              onPressed: () {
                String url = "https://www.google.com/search?q=$teamName1+vs+$teamName2"; ///search?q=Manchester+United+vs+Everton
                _launchURL(url);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
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
