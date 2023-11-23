import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/team_player_model.dart';


Future<List<Team>> getTeams() async {
  QuerySnapshot teamsSnapshot = await FirebaseFirestore.instance.collection('teams').get();
  return teamsSnapshot.docs.map((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Team(
      id: data['id'],
      name: data['name'],
      sport: 'Football',
      background: data['background'],
      profile: data['profile'],
      description: data['description'],
      nextMatches: data['next_matches'],
    );
  }).toList();
}

Future<List<Player>> getPlayers() async {
  QuerySnapshot playersSnapshot = await FirebaseFirestore.instance.collection('players').get();
  return playersSnapshot.docs.map((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Player(
      id: data['id'],
      name: data['name'],
      sport: data['sport'],
      photoUrl: data['photoUrl'],
      nationality: data['nationality'],
      background: data['background'],
      teamId: data['teamId'],
    );
  }).toList();
}

Future<Player> getPlayerById(int playerId) async {
  String playerIdString = playerId.toString(); // Convert int to String
  DocumentSnapshot playerDoc = await FirebaseFirestore.instance.collection('players').doc(playerIdString).get();
  Map<String, dynamic> data = playerDoc.data() as Map<String, dynamic>;
  return Player(
    id: data['id'],
    name: data['name'],
    sport: data['sport'],
    photoUrl: data['photoUrl'],
    nationality: data['nationality'],
    background: data['background'],
    teamId: data['teamId'],
  );
}

Future<Team> getTeamById(int teamId) async {
  String teamIdString = teamId.toString(); // Convert int to String
  DocumentSnapshot teamDoc = await FirebaseFirestore.instance.collection('teams').doc(teamIdString).get();
  Map<String, dynamic> data = teamDoc.data() as Map<String, dynamic>;
  return Team(
    id: data['id'],
    name: data['name'],
    sport: 'Football',
    background: data['background'],
    profile: data['profile'],
    description: data['description'],
    nextMatches: data['next_matches'],
  );
}

Future<List<Player>> getPlayersByTeamId(int teamId) async {
  QuerySnapshot playersSnapshot = await FirebaseFirestore.instance.collection('players')
      .where('teamId', isEqualTo: teamId)
      .get();

  return playersSnapshot.docs.map((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Player(
      id: data['id'],
      name: data['name'],
      sport: data['sport'],
      photoUrl: data['photoUrl'],
      nationality: data['nationality'],
      background: data['background'],
      teamId: data['teamId'],
    );
  }).toList();
}
