import 'package:flutter/material.dart';
import 'package:level_app/models/event_model.dart';
import 'NextMatchContainer.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class NextMatchesColumn extends StatefulWidget {
  List<Event> matches = [];
  List teams = [];

  NextMatchesColumn({super.key, required this.matches, required this.teams});

  @override
  _NextMatchesColumnState createState() => _NextMatchesColumnState();
}

class _NextMatchesColumnState extends State<NextMatchesColumn> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
    scheduleDailyNotification();
  }

  void initializeNotifications() async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'todays_matches_notif', 'Level App - Next Matches');
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  void scheduleDailyNotification() async {
    tzdata.initializeTimeZones();
    final location = tz.getLocation('America/Mexico_City');

    final notificationTime = tz.TZDateTime(
      location,
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      23, // Hora (11 PM)
      45, // Minutos (20 minutos)
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Daily Matches',
      'Revisa los partidos del día',
      notificationTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_matches_notif',
          'Level App - Daily Matches',
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  String getTeam(id, List teams) {
    for (var i = 0; i < teams.length; i++) {
      if (id == teams[i]["id"]) {
        return teams[i]["profile"];
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 10),
                child: Text(
                  'Next Matches',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
              child: Text(
                'See all',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).hintColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var match in widget.matches)
                  NextMatchContainer(
                    date: DateFormat('dd/MM/yyyy HH:mm').format(
                        DateTime.fromMillisecondsSinceEpoch(match.timestamp *
                            1000)), // Ajusta según las propiedades de tu clase Event
                    team1Image: match.homeTeamImage,
                    team2Image: match.awayTeamImage,
                    teamName1: match.homeTeam,
                    teamName2: match.awayTeam,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
