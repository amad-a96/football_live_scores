// To parse this JSON data, do
//
//     final standingsInfo = standingsInfoFromJson(jsonString);

import 'dart:convert';

StandingsInfo standingsInfoFromJson(String str) => StandingsInfo.fromJson(json.decode(str));

String standingsInfoToJson(StandingsInfo data) => json.encode(data.toJson());

class StandingsInfo {
    StandingsInfo({
        this.standings,
    });

    List<Standing>? standings;

    factory StandingsInfo.fromJson(Map<String, dynamic> json) => StandingsInfo(
        standings: List<Standing>.from(json["standings"].map((x) => Standing.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "standings": List<dynamic>.from(standings!.map((x) => x.toJson())),
    };
}

class Standing {
    Standing({
        this.countryName,
        this.leagueId,
        this.leagueName,
        this.teamId,
        this.teamName,
        this.overallPromotion,
        this.overallLeaguePosition,
        this.overallLeaguePayed,
        this.overallLeagueW,
        this.overallLeagueD,
        this.overallLeagueL,
        this.overallLeagueGf,
        this.overallLeagueGa,
        this.overallLeaguePts,
        this.homeLeaguePosition,
        this.homePromotion,
        this.homeLeaguePayed,
        this.homeLeagueW,
        this.homeLeagueD,
        this.homeLeagueL,
        this.homeLeagueGf,
        this.homeLeagueGa,
        this.homeLeaguePts,
        this.awayLeaguePosition,
        this.awayPromotion,
        this.awayLeaguePayed,
        this.awayLeagueW,
        this.awayLeagueD,
        this.awayLeagueL,
        this.awayLeagueGf,
        this.awayLeagueGa,
        this.awayLeaguePts,
        this.leagueRound,
        this.teamBadge,
        this.fkStageKey,
        this.stageName,
    });

    String? countryName;
    String? leagueId;
    String? leagueName;
    String? teamId;
    String? teamName;
    String? overallPromotion;
    String? overallLeaguePosition;
    String? overallLeaguePayed;
    String? overallLeagueW;
    String? overallLeagueD;
    String? overallLeagueL;
    String? overallLeagueGf;
    String? overallLeagueGa;
    String? overallLeaguePts;
    String? homeLeaguePosition;
    String? homePromotion;
    String? homeLeaguePayed;
    String? homeLeagueW;
    String? homeLeagueD;
    String? homeLeagueL;
    String? homeLeagueGf;
    String? homeLeagueGa;
    String? homeLeaguePts;
    String? awayLeaguePosition;
    String? awayPromotion;
    String? awayLeaguePayed;
    String? awayLeagueW;
    String? awayLeagueD;
    String? awayLeagueL;
    String? awayLeagueGf;
    String? awayLeagueGa;
    String? awayLeaguePts;
    String? leagueRound;
    String? teamBadge;
    String? fkStageKey;
    String? stageName;

    factory Standing.fromJson(Map<String, dynamic> json) => Standing(
        countryName: json["country_name"],
        leagueId: json["league_id"],
        leagueName: json["league_name"],
        teamId: json["team_id"],
        teamName: json["team_name"],
        overallPromotion: json["overall_promotion"],
        overallLeaguePosition: json["overall_league_position"],
        overallLeaguePayed: json["overall_league_payed"],
        overallLeagueW: json["overall_league_W"],
        overallLeagueD: json["overall_league_D"],
        overallLeagueL: json["overall_league_L"],
        overallLeagueGf: json["overall_league_GF"],
        overallLeagueGa: json["overall_league_GA"],
        overallLeaguePts: json["overall_league_PTS"],
        homeLeaguePosition: json["home_league_position"],
        homePromotion: json["home_promotion"],
        homeLeaguePayed: json["home_league_payed"],
        homeLeagueW: json["home_league_W"],
        homeLeagueD: json["home_league_D"],
        homeLeagueL: json["home_league_L"],
        homeLeagueGf: json["home_league_GF"],
        homeLeagueGa: json["home_league_GA"],
        homeLeaguePts: json["home_league_PTS"],
        awayLeaguePosition: json["away_league_position"],
        awayPromotion: json["away_promotion"],
        awayLeaguePayed: json["away_league_payed"],
        awayLeagueW: json["away_league_W"],
        awayLeagueD: json["away_league_D"],
        awayLeagueL: json["away_league_L"],
        awayLeagueGf: json["away_league_GF"],
        awayLeagueGa: json["away_league_GA"],
        awayLeaguePts: json["away_league_PTS"],
        leagueRound: json["league_round"],
        teamBadge: json["team_badge"],
        fkStageKey: json["fk_stage_key"],
        stageName: json["stage_name"],
    );

    Map<String, dynamic> toJson() => {
        "country_name": countryName,
        "league_id": leagueId,
        "league_name": leagueName,
        "team_id": teamId,
        "team_name": teamName,
        "overall_promotion": overallPromotion,
        "overall_league_position": overallLeaguePosition,
        "overall_league_payed": overallLeaguePayed,
        "overall_league_W": overallLeagueW,
        "overall_league_D": overallLeagueD,
        "overall_league_L": overallLeagueL,
        "overall_league_GF": overallLeagueGf,
        "overall_league_GA": overallLeagueGa,
        "overall_league_PTS": overallLeaguePts,
        "home_league_position": homeLeaguePosition,
        "home_promotion": homePromotion,
        "home_league_payed": homeLeaguePayed,
        "home_league_W": homeLeagueW,
        "home_league_D": homeLeagueD,
        "home_league_L": homeLeagueL,
        "home_league_GF": homeLeagueGf,
        "home_league_GA": homeLeagueGa,
        "home_league_PTS": homeLeaguePts,
        "away_league_position": awayLeaguePosition,
        "away_promotion": awayPromotion,
        "away_league_payed": awayLeaguePayed,
        "away_league_W": awayLeagueW,
        "away_league_D": awayLeagueD,
        "away_league_L": awayLeagueL,
        "away_league_GF": awayLeagueGf,
        "away_league_GA": awayLeagueGa,
        "away_league_PTS": awayLeaguePts,
        "league_round": leagueRound,
        "team_badge": teamBadge,
        "fk_stage_key": fkStageKey,
        "stage_name": stageName,
    };
}
