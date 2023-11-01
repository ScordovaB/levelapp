import 'package:flutter/material.dart';
import '../../Profiles/TeamProfile.dart';
import '../../Profiles/AthleteProfile.dart';

Widget buildItem(BuildContext context, String imagePath, String teamName, bool team) {
  return InkWell(
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      Navigator.push(
      context,
        MaterialPageRoute(
          builder: (context) => team ? const TeamProfileWidget() : const AthleteProfileWidget(),
        ),
      );
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 100,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          teamName,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: const TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.bold, 
            color: Colors.black, 
          ),
        ),
      ],
    ),
  );
}