import 'package:flutter/material.dart';

class FollowElem extends StatefulWidget {
  const FollowElem({super.key, required this.image, required this.list});

  final String image;
  final List<String> list;

  @override
  State<FollowElem> createState() => _FollowElemState();
}

class _FollowElemState extends State<FollowElem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Stack(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(50),
          //   child: Image.network(
          //     widget.image,
          //     width: 50,
          //     height: 50,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Column(
            children: [
              Container(
                width: 100,
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  widget.list[1],
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  widget.list[0],
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
                onPressed: () {},
                icon: const Icon(Icons.add_circle),
                color:Theme.of(context).colorScheme.primary //Color.fromARGB(255, 15, 55, 10),
              ))
        ],
      ),
    );
  }
}
