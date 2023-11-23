import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:level_app/models/event_model.dart';
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

Future<List<Event>> getEvents() async {
  QuerySnapshot eventsSnapshot = await FirebaseFirestore.instance.collection('events').get();
  return eventsSnapshot.docs.map((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Event(
      id: data['id'],
      sport: data['sport'],
      league: data['league'],
      leagueImage: data['leagueImage'],
      homeTeam: data['homeTeam'],
      homeTeamImage: data['homeTeamImage'],
      awayTeam: data['awayTeam'],
      awayTeamImage: data['awayTeamImage'],
      timestamp: data['timestamp'],
      scoreHome: data['scoreHome'],
      scoreAway: data['scoreAway'],
    );
  }).toList();
}