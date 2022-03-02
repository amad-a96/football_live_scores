// To parse this JSON data, do
//
//     final championsLeagueInfo = championsLeagueInfoFromJson(jsonString);

import 'dart:convert';

MatchesInfo leaguesInfoFromJson(String str) => MatchesInfo.fromJson(json.decode(str));

String leaguesInfoToJson(MatchesInfo data) => json.encode(data.toJson());

class MatchesInfo {
    MatchesInfo({
        this.matches,
    });

    List<Match>? matches;

    factory MatchesInfo.fromJson(Map<String, dynamic> json) => MatchesInfo(
        matches: List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "matches": List<dynamic>.from(matches!.map((x) => x.toJson())),
    };
}

class Match {
    Match({
        this.matchId,
        this.countryId,
        this.countryName,
        this.leagueId,
        this.leagueName,
        this.matchDate,
        this.matchStatus,
        this.matchTime,
        this.matchHometeamId,
        this.matchHometeamName,
        this.matchHometeamScore,
        this.matchAwayteamName,
        this.matchAwayteamId,
        this.matchAwayteamScore,
        this.matchHometeamHalftimeScore,
        this.matchAwayteamHalftimeScore,
        this.matchHometeamExtraScore,
        this.matchAwayteamExtraScore,
        this.matchHometeamPenaltyScore,
        this.matchAwayteamPenaltyScore,
        this.matchHometeamFtScore,
        this.matchAwayteamFtScore,
        this.matchHometeamSystem,
        this.matchAwayteamSystem,
        this.matchLive,
        this.matchRound,
        this.matchStadium,
        this.matchReferee,
        this.teamHomeBadge,
        this.teamAwayBadge,
        this.leagueLogo,
        this.countryLogo,
        this.leagueYear,
        this.fkStageKey,
        this.stageName,
        this.goalscorer,
        this.cards,
        this.substitutions,
        this.lineup,
        this.statistics,
        this.statistics1Half,
    });

    String? matchId;
    String? countryId;
    String ?countryName;
    String? leagueId;
    String? leagueName;
    DateTime? matchDate;
    String? matchStatus;
    String? matchTime;
    String? matchHometeamId;
    String ?matchHometeamName;
    String ?matchHometeamScore;
    String ?matchAwayteamName;
    String? matchAwayteamId;
    String? matchAwayteamScore;
    String? matchHometeamHalftimeScore;
    String? matchAwayteamHalftimeScore;
    String? matchHometeamExtraScore;
    String? matchAwayteamExtraScore;
    String? matchHometeamPenaltyScore;
    String? matchAwayteamPenaltyScore;
    String? matchHometeamFtScore;
    String? matchAwayteamFtScore;
    String? matchHometeamSystem;
    String? matchAwayteamSystem;
    String? matchLive;
    String? matchRound;
    String? matchStadium;
    String? matchReferee;
    String? teamHomeBadge;
    String? teamAwayBadge;
    String? leagueLogo;
    String? countryLogo;
    String ?leagueYear;
    String ?fkStageKey;
    String ?stageName;
    List<Goalscorer>? goalscorer;
    List<dynamic> ?cards;
    Substitutions ?substitutions;
    Lineup? lineup;
    List<Statistic>? statistics;
    List<Statistic> ?statistics1Half;

    factory Match.fromJson(Map<String, dynamic> json) => Match(
        matchId: json["match_id"],
        countryId: json["country_id"],
        countryName: json["country_name"],
        leagueId: json["league_id"],
        leagueName: json["league_name"],
        matchDate: DateTime.parse(json["match_date"]),
        matchStatus: json["match_status"],
        matchTime: json["match_time"],
        matchHometeamId: json["match_hometeam_id"],
        matchHometeamName: json["match_hometeam_name"],
        matchHometeamScore: json["match_hometeam_score"],
        matchAwayteamName: json["match_awayteam_name"],
        matchAwayteamId: json["match_awayteam_id"],
        matchAwayteamScore: json["match_awayteam_score"],
        matchHometeamHalftimeScore: json["match_hometeam_halftime_score"],
        matchAwayteamHalftimeScore: json["match_awayteam_halftime_score"],
        matchHometeamExtraScore: json["match_hometeam_extra_score"],
        matchAwayteamExtraScore: json["match_awayteam_extra_score"],
        matchHometeamPenaltyScore: json["match_hometeam_penalty_score"],
        matchAwayteamPenaltyScore: json["match_awayteam_penalty_score"],
        matchHometeamFtScore: json["match_hometeam_ft_score"],
        matchAwayteamFtScore: json["match_awayteam_ft_score"],
        matchHometeamSystem: json["match_hometeam_system"],
        matchAwayteamSystem: json["match_awayteam_system"],
        matchLive: json["match_live"],
        matchRound: json["match_round"],
        matchStadium: json["match_stadium"],
        matchReferee: json["match_referee"],
        teamHomeBadge: json["team_home_badge"],
        teamAwayBadge: json["team_away_badge"],
        leagueLogo: json["league_logo"],
        countryLogo: json["country_logo"],
        leagueYear: json["league_year"],
        fkStageKey: json["fk_stage_key"],
        stageName: json["stage_name"],
        goalscorer: List<Goalscorer>.from(json["goalscorer"].map((x) => Goalscorer.fromJson(x))),
        cards: List<dynamic>.from(json["cards"].map((x) => x)),
        substitutions: Substitutions.fromJson(json["substitutions"]),
        lineup: Lineup.fromJson(json["lineup"]),
        statistics: List<Statistic>.from(json["statistics"].map((x) => Statistic.fromJson(x))),
        statistics1Half: List<Statistic>.from(json["statistics_1half"].map((x) => Statistic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "country_id": countryId,
        "country_name": countryName,
        "league_id": leagueId,
        "league_name": leagueName,
        "match_date": "${matchDate!.year.toString().padLeft(4, '0')}-${matchDate!.month.toString().padLeft(2, '0')}-${matchDate!.day.toString().padLeft(2, '0')}",
        "match_status": matchStatus,
        "match_time": matchTime,
        "match_hometeam_id": matchHometeamId,
        "match_hometeam_name": matchHometeamName,
        "match_hometeam_score": matchHometeamScore,
        "match_awayteam_name": matchAwayteamName,
        "match_awayteam_id": matchAwayteamId,
        "match_awayteam_score": matchAwayteamScore,
        "match_hometeam_halftime_score": matchHometeamHalftimeScore,
        "match_awayteam_halftime_score": matchAwayteamHalftimeScore,
        "match_hometeam_extra_score": matchHometeamExtraScore,
        "match_awayteam_extra_score": matchAwayteamExtraScore,
        "match_hometeam_penalty_score": matchHometeamPenaltyScore,
        "match_awayteam_penalty_score": matchAwayteamPenaltyScore,
        "match_hometeam_ft_score": matchHometeamFtScore,
        "match_awayteam_ft_score": matchAwayteamFtScore,
        "match_hometeam_system": matchHometeamSystem,
        "match_awayteam_system": matchAwayteamSystem,
        "match_live": matchLive,
        "match_round": matchRound,
        "match_stadium": matchStadium,
        "match_referee": matchReferee,
        "team_home_badge": teamHomeBadge,
        "team_away_badge": teamAwayBadge,
        "league_logo": leagueLogo,
        "country_logo": countryLogo,
        "league_year": leagueYear,
        "fk_stage_key": fkStageKey,
        "stage_name": stageName,
        "goalscorer": List<dynamic>.from(goalscorer!.map((x) => x.toJson())),
        "cards": List<dynamic>.from(cards!.map((x) => x)),
        "substitutions": substitutions!.toJson(),
        "lineup": lineup!.toJson(),
        "statistics": List<dynamic>.from(statistics!.map((x) => x.toJson())),
        "statistics_1half": List<dynamic>.from(statistics1Half!.map((x) => x.toJson())),
    };
}

class Goalscorer {
    Goalscorer({
        this.time,
        this.homeScorer,
        this.homeScorerId,
        this.homeAssist,
        this.homeAssistId,
        this.score,
        this.awayScorer,
        this.awayScorerId,
        this.awayAssist,
        this.awayAssistId,
        this.info,
        this.scoreInfoTime,
    });

    String? time;
    String ?homeScorer;
    String ?homeScorerId;
    String? homeAssist;
    String? homeAssistId;
    String? score;
    String? awayScorer;
    String? awayScorerId;
    String? awayAssist;
    String ?awayAssistId;
    String ?info;
    String? scoreInfoTime;

    factory Goalscorer.fromJson(Map<String, dynamic> json) => Goalscorer(
        time: json["time"],
        homeScorer: json["home_scorer"],
        homeScorerId: json["home_scorer_id"],
        homeAssist: json["home_assist"],
        homeAssistId: json["home_assist_id"],
        score: json["score"],
        awayScorer: json["away_scorer"],
        awayScorerId: json["away_scorer_id"],
        awayAssist: json["away_assist"],
        awayAssistId: json["away_assist_id"],
        info: json["info"],
        scoreInfoTime: json["score_info_time"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "home_scorer": homeScorer,
        "home_scorer_id": homeScorerId,
        "home_assist": homeAssist,
        "home_assist_id": homeAssistId,
        "score": score,
        "away_scorer": awayScorer,
        "away_scorer_id": awayScorerId,
        "away_assist": awayAssist,
        "away_assist_id": awayAssistId,
        "info": info,
        "score_info_time": scoreInfoTime,
    };
}

class Lineup {
    Lineup({
        this.home,
        this.away,
    });

    Away? home;
    Away? away;

    factory Lineup.fromJson(Map<String, dynamic> json) => Lineup(
        home: Away.fromJson(json["home"]),
        away: Away.fromJson(json["away"]),
    );

    Map<String, dynamic> toJson() => {
        "home": home!.toJson(),
        "away": away!.toJson(),
    };
}

class Away {
    Away({
        this.startingLineups,
        this.substitutes,
        this.coach,
        this.missingPlayers,
    });

    List<Coach>? startingLineups;
    List<Coach>? substitutes;
    List<Coach>? coach;
    List<dynamic> ?missingPlayers;

    factory Away.fromJson(Map<String, dynamic> json) => Away(
        startingLineups: List<Coach>.from(json["starting_lineups"].map((x) => Coach.fromJson(x))),
        substitutes: List<Coach>.from(json["substitutes"].map((x) => Coach.fromJson(x))),
        coach: List<Coach>.from(json["coach"].map((x) => Coach.fromJson(x))),
        missingPlayers: List<dynamic>.from(json["missing_players"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "starting_lineups": List<dynamic>.from(startingLineups!.map((x) => x.toJson())),
        "substitutes": List<dynamic>.from(substitutes!.map((x) => x.toJson())),
        "coach": List<dynamic>.from(coach!.map((x) => x.toJson())),
        "missing_players": List<dynamic>.from(missingPlayers!.map((x) => x)),
    };
}

class Coach {
    Coach({
        this.lineupPlayer,
        this.lineupNumber,
        this.lineupPosition,
        this.playerKey,
    });

    String? lineupPlayer;
    String? lineupNumber;
    String? lineupPosition;
    String? playerKey;

    factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        lineupPlayer: json["lineup_player"],
        lineupNumber: json["lineup_number"],
        lineupPosition: json["lineup_position"],
        playerKey: json["player_key"],
    );

    Map<String, dynamic> toJson() => {
        "lineup_player": lineupPlayer,
        "lineup_number": lineupNumber,
        "lineup_position": lineupPosition,
        "player_key": playerKey,
    };
}

class Statistic {
    Statistic({
        this.type,
        this.home,
        this.away,
    });

    String? type;
    String? home;
    String? away;

    factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        type: json["type"],
        home: json["home"],
        away: json["away"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "home": home,
        "away": away,
    };
}

class Substitutions {
    Substitutions({
        this.home,
        this.away,
    });

    List<Home>? home;
    List<dynamic>? away;

    factory Substitutions.fromJson(Map<String, dynamic> json) => Substitutions(
        home: List<Home>.from(json["home"].map((x) => Home.fromJson(x))),
        away: List<dynamic>.from(json["away"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "home": List<dynamic>.from(home!.map((x) => x.toJson())),
        "away": List<dynamic>.from(away!.map((x) => x)),
    };
}

class Home {
    Home({
        this.time,
        this.substitution,
        this.substitutionPlayerId,
    });

    String? time;
    String? substitution;
    String? substitutionPlayerId;

    factory Home.fromJson(Map<String, dynamic> json) => Home(
        time: json["time"],
        substitution: json["substitution"],
        substitutionPlayerId: json["substitution_player_id"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "substitution": substitution,
        "substitution_player_id": substitutionPlayerId,
    };
}
