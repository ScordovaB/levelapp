import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

class HomeCard extends StatefulWidget {
  const HomeCard({super.key, required this.image, required this.text, required this.date});

  final String image;
  final String text;
  final String date;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children:[ Expanded(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.image,
                      width: 170,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                    child: VerticalDivider(
                      thickness: 3,
                      color: Color(0xFF424242),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                   const Icon(
                    Icons.access_time,
                    size: 20,
                  ),
                   Text(widget.date.substring(0, widget.date.length - 10))
                ],
              )
            ],
          ),
        ),
      ),]
    );
  }
}
