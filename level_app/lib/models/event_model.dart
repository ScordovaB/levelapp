class Event {
  final int id;
  final String sport;
  final String league;
  final String leagueImage;
  final String homeTeam;
  final int homeTeamId;
  final String homeTeamImage;
  final String awayTeam;
  final int awayTeamId;
  final String awayTeamImage;
  final int timestamp;
  final int scoreHome;
  final int scoreAway;

  Event({
    required this.id,
    required this.sport,
    required this.league,
    required this.leagueImage,
    required this.homeTeam,
    required this.homeTeamId,
    required this.homeTeamImage,
    required this.awayTeam,
    required this.awayTeamId,
    required this.awayTeamImage,
    required this.timestamp,
    required this.scoreHome,
    required this.scoreAway,
  });
}