import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';


class AppBarLevel extends StatelessWidget {
  const AppBarLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0,0, 15, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/level_logo.png', width: 100, height: 50),
                    const Padding(
                      padding:  EdgeInsets.fromLTRB(0,0,0,0),
                      child:  Text("Welcome back, Jazmin!", style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
                
                // Text(
                //   'LEVEL',
                //   style: GoogleFonts.ubuntu(
                //     fontSize: 30,
                //     color: const Color(0xFF707070),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0,0, 0, 18),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_circle,
                        size: 45,
                        color: Color(0xFF707070),
                      )),
                )
              ],
            ),
          ),
        ]
    );
  }
}