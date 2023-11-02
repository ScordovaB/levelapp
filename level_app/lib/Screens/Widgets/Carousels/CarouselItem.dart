import 'package:flutter/material.dart';
import '../../Profiles/TeamProfile.dart';
import '../../Profiles/AthleteProfile.dart';

Widget buildItem(BuildContext context, String imagePath, String teamName, int id, bool team) {
  return InkWell(
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      Navigator.push(
      context,
        MaterialPageRoute(
          builder: (context) => team ? TeamProfileWidget(id: id,) : AthleteProfileWidget(id: id),
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
          child: Image.network(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          teamName,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.bold, 
            color: Theme.of(context).disabledColor, 
          ),
        ),
      ],
    ),
  );
}