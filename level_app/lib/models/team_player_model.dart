class Team {
  final int id;
  final String name;
  final String sport;
  final String background;
  final String profile;
  final String description;
  final List<dynamic> nextMatches;

  Team({
    required this.id,
    required this.name,
    required this.sport,
    required this.background,
    required this.profile,
    required this.description,
    required this.nextMatches,
  });
}
class Player {
  final int id;
  final String name;
  final String sport;
  final String nationality;
  final String photoUrl;
  final String background;
  final int teamId;

  Player({
    required this.id,
    required this.name,
    required this.sport,
    required this.nationality,
    required this.photoUrl,
    required this.background,
    required this.teamId,
  });
}
