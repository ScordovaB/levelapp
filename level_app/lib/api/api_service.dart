import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import '../models/team_player_model.dart';

Future<List<Team>> fetchFootballTeams(url) async {
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'x-apisports-key': '317f95e694a938fc9bd1b887fd662abd', // Replace with your actual API key
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = json.decode(response.body);

    if (responseData.containsKey('response')) {
      List<dynamic> teamList = responseData['response'];
      return teamList.map<Team>((teamData) {
        return Team(
          id: teamData['team']['id'],
          name: teamData['team']['name'],
          sport: 'Football',
          background: teamData['venue']['image'],
          profile: teamData['team']['logo'],
          description: teamData['team']['name'] +
              ' Football Club from ' +
              teamData['venue']['city'] +
              ' ' +
              teamData['venue']['name'] +
              ' Stadium',
          nextMatches: [],
        );
      }).toList();
    } else {
      throw Exception('Invalid response format - missing "response" key');
    }
  } else {
    throw Exception('Failed to load teams');
  }
}



Future<void> storeTeams(List<Team> teams) async {
  final CollectionReference teamsCollection = FirebaseFirestore.instance.collection('teams');

  for (var team in teams) {
    await teamsCollection.doc(team.id.toString()).set({
      'id': team.id,
      'name': team.name,
      'sport': team.sport, // Assuming the sport is always football
      'background': team.background,
      'profile': team.profile,
      'description': team.description,
      'next_matches': team.nextMatches,
    });
  }
}

Future<List<Player>> fetchFootballPlayers(String apiUrl) async {
  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {
      'x-apisports-key': '317f95e694a938fc9bd1b887fd662abd', // Replace with your actual API key
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
    if (responseData.containsKey('response')) {
      List<dynamic> playerList = responseData['response'];
      return playerList.map<Player>((playerData) {
        return Player(
          id: playerData['player']['id'],
          name: playerData['player']['name'],
          sport: 'Football',
          nationality: playerData['player']['nationality'],
          photoUrl: playerData['player']['photo'],
          background: playerData['statistics'][0]['team']['logo'],
          teamId: playerData['statistics'][0]['team']['id'], // Assuming the team id is in the first statistics entry
        );
      }).toList();
    } else {
      throw Exception('Invalid response format - missing "response" key');
    }
  } else {
    throw Exception('Failed to load players');
  }
}
Future<void> storePlayers(List<Player> players) async {
  try {
    final CollectionReference playersCollection = FirebaseFirestore.instance.collection('players');

    for (var player in players) {
      await playersCollection.doc(player.id.toString()).set({
        'id': player.id,
        'name': player.name,
        'sport': player.sport,
        'nationality': player.nationality,
        'photoUrl': player.photoUrl,
        'background': player.background,
        'teamId': player.teamId,
      });
    }

    print('Players stored successfully!');
  } catch (e) {
    print('Error storing players: $e');
  }
}

Future<void> storeSampleData() async {
  try {
    final List<Team> sampleTeams = [
      Team(
        id: 1,
        name: "Team A",
        sport: "Football",
        background: "background_image_url",
        profile: "profile_image_url",
        description: "Description for Team A",
        nextMatches: [],
      ),
      Team(
        id: 2,
        name: "Team B",
        sport: "Football",
        background: "background_image_url",
        profile: "profile_image_url",
        description: "Description for Team B",
        nextMatches: [],
      ),
      // Add more teams as needed
    ];

    final CollectionReference teamsCollection = FirebaseFirestore.instance.collection('teams');

    for (var team in sampleTeams) {
      await teamsCollection.doc(team.id.toString()).set({
        'id': team.id,
        'name': team.name,
        'background': team.background,
        'profile': team.profile,
        'description': team.description,
        'next_matches': team.nextMatches,
      });
    }

    print('Sample data stored successfully!');
  } catch (e) {
    print('Error storing sample data: $e');
  }
}
