import 'dart:convert';

import 'package:football_live_scores/models/Matches_Info.dart';
import 'package:football_live_scores/models/Standings_Info.dart';

import 'package:http/http.dart' as http;

class FootballApiManager {
  Stream<MatchesInfo> getResultsandFixtures(
      List<DateTime> fromTo, String league_Id) async* {
    var matchs = null;
    String action = 'get_events';
    String from = fromTo.first.toString();
    String to = fromTo.last.toString();
    //String league_Id = '152';
    String apiKey =
        '62c92e6d67892c59a208b694da45c9f787c137119f1fc6046e9f0e61ebf1d6a0';
    var url = Uri.parse(
        'https://apiv3.apifootball.com/?action=get_events&from=${fromTo.first}&to=${fromTo.last}&league_id=$league_Id&APIkey=$apiKey');
    var client = http.Client();

    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var js = '{"matches":$jsonString}';

        var jsonMap = json.decode(js);
        print("--------------------------------");
        var matchs = MatchesInfo.fromJson(jsonMap);
        print(matchs);
        yield matchs;
      }
    } catch (e) {
      print(e);
    }
  }

  Stream<StandingsInfo> getStandings(String league_Id) async* {
    var standings = null;
    String action = 'get_standings';

    //String league_Id = '152';
    String apiKey =
        '62c92e6d67892c59a208b694da45c9f787c137119f1fc6046e9f0e61ebf1d6a0';
    var url = Uri.parse(
        'https://apiv3.apifootball.com/?action=$action&league_id=$league_Id&APIkey=$apiKey');
    var client = http.Client();

    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var js = '{"standings":$jsonString}';

        var jsonMap = json.decode(js);

        var standings = StandingsInfo.fromJson(jsonMap);
        print(standings);
        yield standings;
      }
    } catch (e) {
      print(e);
    }
  }
}
