import 'package:flutter/material.dart';
import 'package:level_app/Screens/Profiles/UserProfile.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBarHome(BuildContext context) {
  return AppBar(
    toolbarHeight: 75,
    backgroundColor: Theme.of(context).colorScheme.background,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image.asset('assets/images/level_logo.png',
        //     width: 100, height: 50),
        Text(
          'LEVEL',
          style: GoogleFonts.racingSansOne(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text(
            "Welcome back, Jazmin!",
            style: TextStyle(
                fontSize: 12, color: Theme.of(context).unselectedWidgetColor),
          ),
        ),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
        child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserProfileWidget(),
                ),
              );
            },
            icon: const Icon(
              Icons.account_circle,
              size: 45,
              color: Color(0xFF707070),
            )),
      )
    ],
  );
}
