import 'package:flutter/material.dart';

import '../../models/team_model.dart';



// class ProfileList extends StatelessWidget {
//   const ProfileList ({super.key, required this.profiles});

//   final List profiles;
  
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: profiles.length,

//       separatorBuilder: (context,index){
//         return const  Divider();
//       },
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: Image.asset("${profiles[index]["image"]}", width: 50, height: 50,),
//           title: Text("${profiles[index]["name"]}"),
//           subtitle: Text('${profiles[index]["type"]}\n${profiles[index]["discipline"]}'),
//         );
//       },
//     );
//   }
// }
class ProfileList extends StatelessWidget {
  const ProfileList({Key? key, required this.profiles}) : super(key: key);

  final List<dynamic> profiles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: profiles.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        if (profiles[index] is Team) {
          // Render team item
          Team team = profiles[index] as Team;
          return ListTile(
            leading: Image.network(team.profile, width: 50, height: 50),
            title: Text(team.name),
            subtitle: Text('${team.sport}\nTeam'),
          );
        } else if (profiles[index] is Player) {
          // Render player item
          Player player = profiles[index] as Player;
          return ListTile(
            leading: Image.network(player.photoUrl, width: 50, height: 50),
            title: Text(player.name),
            subtitle: Text('Player\n : ${player.sport}'),
          );
        } else {
          return Container(); // Placeholder for other types, if any
        }
      },
    );
  }
}