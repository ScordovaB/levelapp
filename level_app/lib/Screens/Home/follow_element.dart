import 'package:flutter/material.dart';
import 'package:level_app/Screens/Profiles/AthleteProfile.dart';
import 'package:level_app/Screens/Profiles/TeamProfile.dart';
import 'package:level_app/api/users_requests.dart';
import 'package:level_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:level_app/api/firestore_requests.dart';
import 'dart:async';

class FollowElem extends StatefulWidget {
  const FollowElem(
      {Key? key,
      required this.image,
      required this.name,
      required this.id,
      required this.team})
      : super(key: key);

  final String image;
  final String name;
  final int id;
  final bool team;

  @override
  State<FollowElem> createState() => _FollowElemState();
}

class _FollowElemState extends State<FollowElem> {
  Timer? _timer;

  late Future<User> fetchedUser;
  User user = User(
    userId: "0",
    name: "",
    email: "",
    teams: [],
    players: [],
    profile: "",
    background: 0,
  );

  Future<void> setData() async {
    User fetchedUserData = await fetchedUser;
    setState(() {
      user = fetchedUserData;
    });
    setState(() {});
  }

  void _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedUserId = prefs.getString('userId') ?? '';
    if (storedUserId.isNotEmpty) {
      setState(() {
        fetchedUser = getUserById(storedUserId);
      });
    }
  }

  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedUserId = prefs.getString('userId') ?? '';
    return getUserById(storedUserId);
  }

  @override
  void initState() {
    super.initState();
    _loadUserId();
    getUser().then((User user) {
      setState(() {
        fetchedUser = Future.value(user);
      });
      setData();
    });
     _timer = Timer.periodic(Duration(seconds: 5), (Timer t) => setData());
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget.team
                ? TeamProfileWidget(
                    id: widget.id,
                  )
                : AthleteProfileWidget(id: widget.id),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://i.gifer.com/ZKZg.gif',
                        width: 100,
                        height: 50,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 55,
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: -10,
              right: -10,
              child: IconButton(
                onPressed: () {
                  if (widget.team) {
                    if (user.teams.contains(widget.id)) {
                      removeTeamFromUser(user.userId, widget.id).then((value) {
                        setState(() {
                          user.teams.remove(widget.id);
                        });
                      });
                    } else {
                      addTeamToUser(user.userId, widget.id).then((value) {
                        setState(() {
                          user.teams.add(widget.id);
                        });
                      });
                    }
                  } else {
                    if (user.players.contains(widget.id)) {
                      removePlayerFromUser(user.userId, widget.id)
                          .then((value) {
                        setState(() {
                          user.players.remove(widget.id);
                        });
                      });
                    } else {
                      addPlayerToUser(user.userId, widget.id).then((value) {
                        setState(() {
                          user.players.add(widget.id);
                        });
                      });
                    }
                  }
                },
                icon: Icon(
                  (user.players.contains(widget.id) && !widget.team) ||
                          (user.teams.contains(widget.id) && widget.team)
                      ? Icons.remove_circle
                      : Icons.add_circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
