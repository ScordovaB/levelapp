import 'package:flutter/material.dart';
import 'NewsCard.dart';

class NewsContainer extends StatefulWidget {
  @override
  _NewsContainerState createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 233,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        child: Container(
          width: double.infinity,
          height: 500,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    NewsCard(
                      imageURL:
                          'https://phantom-marca.unidadeditorial.es/715b32394314ee60b203b38b129ff338/resize/660/f/webp/assets/multimedia/imagenes/2023/09/27/16958331088440.jpg',
                      title: 'Real Madrid sends invitation to girl who was subject to racist insults near the Metropolitano',
                      subtitle: 'Real Madrid has contacted the family of the girl who received racist insults in the vicinity of the Metropolitano before last Sunday\'s derby...',
                    ),
                    NewsCard(
                      imageURL:
                          'https://ss-i.thgim.com/public/incoming/a4mxos/article67351630.ece/alternates/LANDSCAPE_1200/Britain_Soccer_Premier_League_11700.jpg',
                      title: 'Newcastle hosts Man City in League Cup; Madrid looks to bounce back against Las Palmas',
                      subtitle: 'Newcastle hosts Manchester City in the third round of the English League Cup on Wednesday, while Real Madrid will look to rebound from...',
                    ),
                    NewsCard(
                      imageURL:
                          'https://phantom-marca.unidadeditorial.es/2bb41c13349a490a61dfa8208e19c3af/crop/0x0/2044x1363/resize/660/f/webp/assets/multimedia/imagenes/2023/09/23/16954864395627.jpg',
                      title: 'Why do Real Madrid have a crown on their crest and which other teams have it?',
                      subtitle: 'Madrid CF is the original name of the club, by which it was founded in 1902. The club\'s crest has these initials on the inside and the...',
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 16),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) async {
                      await _pageController.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    effect: ExpandingDotsEffect(
                      expansionFactor: 3,
                      spacing: 8,
                      radius: 16,
                      dotWidth: 16,
                      dotHeight: 8,
                      dotColor: Colors.greenAccent,
                      activeDotColor: Theme.of(context).primaryColor,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

