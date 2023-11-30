import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:level_app/models/event_model.dart';
import '../models/team_player_model.dart';


Future<List<Team>> getTeams({int limit = -1}) async {
  QuerySnapshot teamsSnapshot;
  if (limit > 0) {
    teamsSnapshot = await FirebaseFirestore.instance.collection('teams').limit(limit).get();
  } else {
    teamsSnapshot = await FirebaseFirestore.instance.collection('teams').get();
  }

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

Future<List<Player>> getPlayers({int limit = -1}) async {
  QuerySnapshot playersSnapshot;
  if (limit > 0) {
    playersSnapshot = await FirebaseFirestore.instance.collection('players').limit(limit).get();
  } else {
    playersSnapshot = await FirebaseFirestore.instance.collection('players').get();
  }

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
      homeTeamId: data['homeTeamId'],
      homeTeamImage: data['homeTeamImage'],
      awayTeam: data['awayTeam'],
      awayTeamId: data['awayTeamId'],
      awayTeamImage: data['awayTeamImage'],
      timestamp: data['timestamp'],
      scoreHome: data['scoreHome'],
      scoreAway: data['scoreAway'],
    );
  }).toList();
}

Future<List<Team>> getTeamsByIds(List<dynamic> teamIds) async {
  List<Team> teams = [];
  for (int teamId in teamIds) {
    Team team = await getTeamById(teamId);
    teams.add(team);
    }
  return teams;
}

Future<List<Player>> getPlayersByIds(List<dynamic> playerIds) async {
  List<Player> players = [];
  for (int playerId in playerIds) {
    print("-------------------");
    print(playerId);
    print("-------------------");
    Player player = await getPlayerById(playerId);
    players.add(player);
  }
  return players;
}

Future<void> addTeamToUser(String userId, int teamId) async {
  DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(userId);

  DocumentSnapshot userSnapshot = await userRef.get();
  Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

  List<dynamic> teams = userData['teams'] ?? [];

  if (!teams.contains(teamId)) {
    teams.add(teamId);
    await userRef.update({'teams': teams});
  }
}

Future<void> removeTeamFromUser(String userId, int teamId) async {
  DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(userId);

  DocumentSnapshot userSnapshot = await userRef.get();
  Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

  if (userData.containsKey('teams')) {
    List<dynamic> teams = userData['teams'];

    teams.remove(teamId);

    await userRef.update({'teams': teams});
  }
}

Future<void> addPlayerToUser(String userId, int playerId) async {
  DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(userId);

  DocumentSnapshot userSnapshot = await userRef.get();
  Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

  List<dynamic> players = userData['players'] ?? [];

  if (!players.contains(playerId)) {
    players.add(playerId);
    await userRef.update({'players': players});
  }
}

Future<void> removePlayerFromUser(String userId, int playerId) async {
  DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(userId);

  DocumentSnapshot userSnapshot = await userRef.get();
  Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

  if (userData.containsKey('players')) {
    List<dynamic> players = userData['players'];

    players.remove(playerId);

    await userRef.update({'players': players});
  }
}

Future<List<Event>> getEventsForTeam(int teamId) async {
  // Get the team details using the provided getTeamById function
  //Team team = await getTeamById(teamId);

  // Get all events using the provided getEvents function
  List<Event> allEvents = await getEvents();

  // Filter events for the specified team ID
  List<Event> teamEvents = allEvents.where((event) {
    return event.homeTeamId == teamId || event.awayTeamId == teamId;
  }).toList();

  // You can customize the sorting logic based on your needs
  teamEvents.sort((a, b) => a.timestamp.compareTo(b.timestamp));

  return teamEvents;
}

Future<void> updateProfileToUser(String userId, String profile) async {
  DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(userId);

  await userRef.update({'profile': profile});
}

Future<void> updateBackgroundToUser(String userId, int bg) async {
  DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(userId);

  await userRef.update({'background': bg});
}
