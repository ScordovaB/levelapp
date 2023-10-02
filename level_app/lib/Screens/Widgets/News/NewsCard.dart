import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String imageURL;
  final String title;
  final String subtitle;

  NewsCard({
    required this.imageURL,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Theme.of(context).backgroundColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageURL,
              width: 365,
              height: 200,
              fit: BoxFit.cover,
              alignment: Alignment(-1.00, 0.00),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.93, -0.64),
            child: Container(
              width: 271,
              height: 73,
              decoration: BoxDecoration(
                color: Color(0xA6FFFFFF),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 3, 5, 0),
                  child: Text(
                    title,
                    maxLines: 4,
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.97, 0.70),
            child: Container(
              width: 219,
              height: 73,
              decoration: BoxDecoration(
                color: Color(0xA6FFFFFF),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 3, 5, 0),
                  child: Text(
                    subtitle,
                    maxLines: 4,
                    style: TextStyle(
                      fontSize: 14, 
                      color: Colors.black, 
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.91, 0.90),
            child: ElevatedButton(
              onPressed: () {
                print('Button pressed ...');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF3299E7),
                padding: EdgeInsets.symmetric(horizontal: 24),
              ),
              child: Text(
                'Read More',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}