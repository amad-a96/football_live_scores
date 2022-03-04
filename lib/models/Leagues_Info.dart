// To parse this JSON data, do
//
//     final leaguesInfo = leaguesInfoFromJson(jsonString);

import 'dart:convert';

LeaguesInfo leaguesInfoFromJson(String str) =>
    LeaguesInfo.fromJson(json.decode(str));

String leaguesInfoToJson(LeaguesInfo data) => json.encode(data.toJson());

class LeaguesInfo {
  LeaguesInfo({
    this.leagues,
  });

  List<League>? leagues;

  factory LeaguesInfo.fromJson(Map<String, dynamic> json) => LeaguesInfo(
        leagues:
            List<League>.from(json["leagues"].map((x) => League.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "leagues": List<dynamic>.from(leagues!.map((x) => x.toJson())),
      };
}

class League {
  League({
    this.countryId,
    this.countryName,
    this.leagueId,
    this.leagueName,
    this.leagueSeason,
    this.leagueLogo,
    this.countryLogo,
  });

  String? countryId;
  String? countryName;
  String? leagueId;
  String? leagueName;
  String? leagueSeason;
  String? leagueLogo;
  String? countryLogo;

  factory League.fromJson(Map<String, dynamic> json) => League(
        countryId: json["country_id"],
        countryName: json["country_name"],
        leagueId: json["league_id"],
        leagueName: json["league_name"],
        leagueSeason: json["league_season"],
        leagueLogo: json["league_logo"],
        countryLogo: json["country_logo"],
      );

  Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "country_name": countryName,
        "league_id": leagueId,
        "league_name": leagueName,
        "league_season": leagueSeason,
        "league_logo": leagueLogo,
        "country_logo": countryLogo,
      };
}
