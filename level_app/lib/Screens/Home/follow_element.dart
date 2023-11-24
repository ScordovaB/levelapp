import 'package:flutter/material.dart';
import 'package:level_app/Screens/Profiles/AthleteProfile.dart';
import 'package:level_app/Screens/Profiles/TeamProfile.dart';

class FollowElem extends StatefulWidget {
  const FollowElem({Key? key, required this.image, required this.name, required this.id, required this.team}) : super(key: key);

  final String image;
  final String name;
  final int id;
  final bool team;

  @override
  State<FollowElem> createState() => _FollowElemState();
}

class _FollowElemState extends State<FollowElem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget.team ? TeamProfileWidget(id: widget.id,) : AthleteProfileWidget(id: widget.id),
        ),
      );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://i.gifer.com/ZKZg.gif',
                      width: 100,
                      height: 50,
                      fit: BoxFit.contain,
                    );
                  },
                  ),
                ),
                SizedBox(
                  width: 55,
                  child: Text(
                    widget.name,
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: -10,
              right: -10,
              child: IconButton(
                onPressed: () {
                  print('IconButton clicked for ${widget.name} (ID: ${widget.id})');
                },
                icon: const Icon(Icons.add_circle),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
