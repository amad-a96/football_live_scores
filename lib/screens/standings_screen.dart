import 'package:flutter/material.dart';
import 'package:football_live_scores/models/Standings_Info.dart';
import 'package:football_live_scores/services/football_Api_Manager.dart';
import 'package:football_live_scores/widgets/Standing_Card.dart';

class StandingsScreen extends StatefulWidget {
  const StandingsScreen({Key? key}) : super(key: key);

  @override
  _StandingsScreenState createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  Future<StandingsInfo> _stadings = FootballApiManager().getStandings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<StandingsInfo>(
          future: _stadings,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.standings!.length,
                itemBuilder: (context, index) {
                  return StandingCard(
                    standingsInfo: snapshot.data!,
                    index: index,
                  );
                },
              );
            } else
              return CircularProgressIndicator();
          },
        ));
  }
}
