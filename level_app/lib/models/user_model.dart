class User{
  final String userId;
  final String name;
  final String email;
  final List<dynamic> teams;
  final List<dynamic> players;
  final String profile;
  final int background;
  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.teams,
    required this.players,
    required this.profile,
    required this.background,
  });

}