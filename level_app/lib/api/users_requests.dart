import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:level_app/models/event_model.dart';
import '../models/team_player_model.dart';
import 'package:level_app/models/user_model.dart';

Future<User> getUserById(String userId) async {
  DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
  Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
  return User(
    id: data['userId'],
    name: data['name'],
    email: data['email'],
    teams: data['teams'],
    players: data['players'],
    profile: data['profile'],
    background: data['background'],
  );
}