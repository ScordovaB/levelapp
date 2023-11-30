import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class NewsCard extends StatelessWidget {
  final String imageURL;
  final String title;
  final String subtitle;
  final String externalLink; // Add the external link property

  NewsCard({
    required this.imageURL,
    required this.title,
    required this.subtitle,
    required this.externalLink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Theme.of(context).colorScheme.background,
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
              alignment: const Alignment(-1.00, 0.00),
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://img.freepik.com/vector-premium/banners-television-noticias-ultima-hora-sobre-fondo-blanco_714603-853.jpg', // Provide the path to your placeholder image
                  width: 365,
                  height: 200,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.93, -0.64),
            child: Container(
              width: 271,
              height: 73,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: const AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 3, 5, 0),
                  child: Text(
                    title,
                    maxLines: 4,
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.97, 0.70),
            child: Container(
              width: 219,
              height: 73,
              decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: const AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 3, 5, 0),
                  child: Text(
                    subtitle,
                    maxLines: 4,
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-0.91, 0.90),
            child: ElevatedButton(
              onPressed: () {
                _launchURL(externalLink);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              child: const Text(
                'Read More',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  try {
    await launcher.launchUrl(Uri.parse(url));
  } catch (e) {
    print('Error launching URL: $e');
  }
}
