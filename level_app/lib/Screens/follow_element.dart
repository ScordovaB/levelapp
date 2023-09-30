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
                              Container(
                                width: 100,
                                height: 80,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,                
                                ),
                                child: Image.asset(
                                  widget.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Positioned(
                                bottom: -10,
                                right: -10,
                                
                                child: IconButton(onPressed: (){},icon: const Icon(Icons.add_circle),color: Color.fromARGB(255, 15, 55, 10),))
                            ],
                          ),
                        );
  }
}