import 'package:flutter/material.dart';


class FollowElem extends StatefulWidget {
  const FollowElem({super.key, required this.image});

  final String image;

  @override
  State<FollowElem> createState() => _FollowElemState();
}

class _FollowElemState extends State<FollowElem> {
  @override
  Widget build(BuildContext context) {
    return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  widget.image,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: -10,
                                right: -10,
                                child: IconButton(onPressed: (){},icon: const Icon(Icons.add_circle),color: const Color.fromARGB(255, 16, 163, 26),))
                            ],
                          ),
                        );
  }
}