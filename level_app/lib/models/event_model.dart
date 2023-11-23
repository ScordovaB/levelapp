class Event {
  final int id;
  final String sport;
  final String league;
  final String leagueImage;
  final String homeTeam;
  final String homeTeamImage;
  final String awayTeam;
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
    required this.homeTeamImage,
    required this.awayTeam,
    required this.awayTeamImage,
    required this.timestamp,
    required this.scoreHome,
    required this.scoreAway,
  });
}