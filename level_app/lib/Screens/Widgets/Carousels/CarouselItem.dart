import 'package:flutter/material.dart';

Widget buildItem(BuildContext context, String imagePath, String teamName, String linkPage) {
  return InkWell(
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () async {
      Navigator.of(context).pushNamed(linkPage);
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
            fontSize: 14, // Tamaño de fuente
            fontWeight: FontWeight.bold, // Peso de la fuente
            color: Colors.black, // Color de texto
          ),
        ),
      ],
    ),
  );
}