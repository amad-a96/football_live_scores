import 'dart:convert';

import 'package:football_live_scores/models/Leagues_Info.dart';
import 'package:football_live_scores/models/Standings_Info.dart';

import 'package:http/http.dart' as http;

class FootballApiManager {
  Future<LeaguesInfo> getResultsandFixtures() async {
    var matchs = null;
    String action = 'get_events';
    String from = 'from=2022-02-16';
    String to = 'to=2022-02-17';
    String league_Id = '152';
    String apiKey =
        'APIkey=214b70b8f9df90e70973320ca1a0ea45585ba9a0d969bd74cfd4a25f75e842ea';
    var url = Uri.parse(
        'https://apiv3.apifootball.com/?action=get_events&from=2022-02-19&to=2022-02-20&league_id=$league_Id&APIkey=214b70b8f9df90e70973320ca1a0ea45585ba9a0d969bd74cfd4a25f75e842ea');
    var client = http.Client();

    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var js = '{"matches":$jsonString}';
        //championFromJson(jsonString);
        var jsonMap = json.decode(js);
        print("--------------------------------");
        var matchs = LeaguesInfo.fromJson(jsonMap);
        print(matchs);
        return matchs;
      }
    } catch (e) {
      print(e);
      // print(competitions);
      return matchs;
    }
    print(matchs);
    print("+++++++++++++++++++");
    return matchs;
  }

  Future<StandingsInfo> getStandings() async {
    var standings = null;
    String action = 'get_standings';

    String league_Id = '152';
    String apiKey =
        'APIkey=214b70b8f9df90e70973320ca1a0ea45585ba9a0d969bd74cfd4a25f75e842ea';
    var url = Uri.parse(
        'https://apiv3.apifootball.com/?action=$action&league_id=$league_Id&APIkey=214b70b8f9df90e70973320ca1a0ea45585ba9a0d969bd74cfd4a25f75e842ea');
    var client = http.Client();

    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var js = '{"standings":$jsonString}';
        //championFromJson(jsonString);
        var jsonMap = json.decode(js);
        print("--------------------------------");
        var standings = StandingsInfo.fromJson(jsonMap);
        print(standings);
        return standings;
      }
    } catch (e) {
      print(e);
      // print(competitions);
      return standings;
    }
    print(standings);
    print("+++++++++++++++++++");
    return standings;
  }
}
