class User{
  final String id;
  final String name;
  final String email;
  final List<dynamic> teams;
  final List<dynamic> players;
  final int profile;
  final int background;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.teams,
    required this.players,
    required this.profile,
    required this.background,
  });

}