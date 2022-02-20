import 'package:flutter/material.dart';

import 'package:football_live_scores/models/Leagues_Info.dart';

import 'package:football_live_scores/services/football_Api_Manager.dart';
import 'package:football_live_scores/widgets/result%20_and_fixture_card.dart';

class ResultsandFixturesScreen extends StatefulWidget {
  ResultsandFixturesScreen({Key? key}) : super(key: key);

  @override
  _ResultsandFixturesScreenState createState() =>
      _ResultsandFixturesScreenState();
}

class _ResultsandFixturesScreenState extends State<ResultsandFixturesScreen> {
  Future<LeaguesInfo> _matchs = FootballApiManager().getResultsandFixtures();
  //print(_competitions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<LeaguesInfo>(
          future: _matchs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.matches!.length,
                itemBuilder: (context, index) {
                  return ResultandFixtureCard(
                    leaguesInfo: snapshot.data!,
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
