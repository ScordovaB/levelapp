import 'package:flutter/material.dart';
import 'package:level_app/Screens/Profiles/AthleteProfile.dart';
import 'package:level_app/Screens/Profiles/TeamProfile.dart';
import 'package:level_app/models/team_player_model.dart';
import 'package:level_app/api/firestore_requests.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({Key? key, required this.profiles, required this.isTeam}) : super(key: key);

  final List<dynamic> profiles;
  final bool isTeam;

  @override
  State<SeeAll> createState() => _SeeAll();
}

class _SeeAll extends State<SeeAll> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Team> teams = [];
  List<Player> players = [];
  @override
  void initState() {
    super.initState();
    if (widget.isTeam) {
      teams = widget.profiles as List<Team>;
    } else {
      players = widget.profiles as List<Player>;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'See All',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: widget.isTeam ? teams.length : players.length,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          if(widget.isTeam){
            Team team = teams[index];
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
              subtitle: Text('Team\n : ${team.sport}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeamProfileWidget(
                      id: team.id,
                    ),
                  ),
                );
              },
            );
          }else{
            Player player = players[index];
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
                    builder: (context) => AthleteProfileWidget(
                      id: player.id,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
