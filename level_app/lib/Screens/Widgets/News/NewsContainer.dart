import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'NewsCard.dart';

class NewsContainer extends StatefulWidget {
  List news = [];

  NewsContainer({super.key, required this.news});

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
                    for (var newsItem in widget.news)
                      NewsCard(
                        imageURL: newsItem['urlToImage'],
                        title: newsItem['title'],
                        subtitle: newsItem['description'],
                        externalLink: newsItem['url'],
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

