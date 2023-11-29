import 'package:flutter/material.dart';

import '../../models/team_player_model.dart';
import 'package:level_app/Screens/Profiles/TeamProfile.dart';
import 'package:level_app/Screens/Profiles/AthleteProfile.dart';


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
            leading: Image.network(
              team.profile,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://img.asmedia.epimg.net/resizer/QJBGgqKY4XIpohTFLoA7KMCmaMQ=/1472x1104/cloudfront-eu-central-1.images.arcpublishing.com/diarioas/JULRSPQBN5CF3JDHEYI2INPWQY.jpg',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  );
                },
            ),
            title: Text(team.name),
            subtitle: Text('${team.sport}\nTeam'),
            onTap: () {
              Navigator.push(
                context,
                  MaterialPageRoute(
                    builder: (context) => TeamProfileWidget(id: team.id,),
                  ),
                );
            }
          );
        } else if (profiles[index] is Player) {
          // Render player item
          Player player = profiles[index] as Player;
          return ListTile(
            leading: Image.network(
              player.photoUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://as1.ftcdn.net/v2/jpg/02/59/39/46/1000_F_259394679_GGA8JJAEkukYJL9XXFH2JoC3nMguBPNH.jpg',
                    fit: BoxFit.contain,
                  );
                },
            ),
            title: Text(player.name),
            subtitle: Text('Player\n : ${player.sport}'),
            onTap: () {
              Navigator.push(
                context,
                  MaterialPageRoute(
                    builder: (context) => AthleteProfileWidget(id: player.id,),
                  ),
                );
            }
          );
        } else {
          return Container(); // Placeholder for other types, if any
        }
      },
    );
  }
}