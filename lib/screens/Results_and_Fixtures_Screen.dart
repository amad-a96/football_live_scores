import 'package:flutter/material.dart';
import 'package:football_live_scores/models/Leagues_info.dart';

import 'package:football_live_scores/models/Matches_Info.dart';

import 'package:football_live_scores/services/football_Api_Manager.dart';
import 'package:football_live_scores/widgets/result%20_and_fixture_card.dart';
import 'package:intl/intl.dart';
import 'package:isoweek/isoweek.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

import '../provider/Topbar_navigation_provider.dart';
import '../widgets/league_card.dart';

class ResultsandFixturesScreen extends StatefulWidget {
  ResultsandFixturesScreen({Key? key}) : super(key: key);

  @override
  _ResultsandFixturesScreenState createState() =>
      _ResultsandFixturesScreenState();
}

class _ResultsandFixturesScreenState extends State<ResultsandFixturesScreen> {
  String leagueId = '152';
  int nextWeekcount = 1;
  int previouseWeekcount = 1;
  List<DateTime> currentWeek = Week.current().days;
  Stream<MatchesInfo>? _matchs;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    //  Provider.of<TopBar>(context, listen: false).loadFromPreferences();
    setState(() {
      _matchs =
          FootballApiManager().getResultsandFixtures(currentWeek, leagueId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Provider.of<TopBar>(context).listofLeagues.length,
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: LeagueSearchDelegate());
                  },
                  icon: Icon(
                    Icons.search,
                  )),
            ],
            centerTitle: true,
            title: const Text('Football Scores',
                style: TextStyle(
                  color: Colors.white,
                )),
            elevation: 0,
            //backgroundColor: Colors.transparent,

            backgroundColor: Color.fromARGB(255, 39, 36, 63),
          ),
          backgroundColor: Color.fromARGB(255, 242, 241, 243),
          body: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 39, 36, 63),
                height: 80,
                width: double.infinity,
                child: TabBar(
                    isScrollable: true,
                    indicatorWeight: 3,
                    indicatorColor: Colors.amber,
                    labelColor: Color.fromARGB(255, 39, 36, 63),
                    onTap: (value) {
                      print(value);
                      leagueId = Provider.of<TopBar>(context, listen: false)
                          .listofLeagues[value];

                      setState(() {
                        _matchs = FootballApiManager()
                            .getResultsandFixtures(currentWeek, leagueId);
                      });
                    },
                    tabs: Provider.of<TopBar>(context).listofWidgets),
              ),
              Expanded(
                child: StreamBuilder<MatchesInfo>(
                  stream: _matchs,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SmartRefresher(
                        enablePullUp: true,
                        controller: refreshController,
                        onRefresh: () async {
                          Week currentWeek = Week.current();
                          Week futureWeek =
                              currentWeek.subtractWeeks(previouseWeekcount);

                          _matchs = FootballApiManager()
                              .getResultsandFixtures(futureWeek.days, leagueId);
                          previouseWeekcount++;
                          nextWeekcount--;
                          setState(() {});
                          await Future.delayed(Duration(milliseconds: 1000))
                              .then((value) =>
                                  refreshController.refreshCompleted());
                        },
                        onLoading: () async {
                          Week currentWeek = Week.current();
                          Week futureWeek = currentWeek.addWeeks(nextWeekcount);

                          _matchs = FootballApiManager()
                              .getResultsandFixtures(futureWeek.days, leagueId);
                          nextWeekcount++;
                          previouseWeekcount--;
                          setState(() {});
                          await Future.delayed(Duration(milliseconds: 1000))
                              .then(
                                  (value) => refreshController.loadComplete());
                        },
                        child: ListView.builder(
                          // controller: _scrollController,
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data!.matches!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                index == 0
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 28.0),
                                        child: Text(
                                          snapshot.data!.matches![0].matchDate!
                                                  .isToday
                                              ? 'Today'
                                              : snapshot.data!.matches![0]
                                                      .matchDate!.isTomorrow
                                                  ? 'Tomorrow'
                                                  : snapshot
                                                          .data!
                                                          .matches![0]
                                                          .matchDate!
                                                          .isYesterday
                                                      ? 'Yesterday'
                                                      : DateFormat.MMMMEEEEd()
                                                          .format(snapshot
                                                              .data!
                                                              .matches![0]
                                                              .matchDate!),
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  143, 72, 66, 117),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    : Container(),
                                ResultandFixtureCard(
                                  matchesInfo: snapshot.data!,
                                  index: index,
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    } else
                      return Center(child: shimmerEffectUIWidget());
                  },
                ),
              ),
            ],
          )),
    );
  }

  Widget shimmerEffectUIWidget() => Shimmer.fromColors(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(padding: EdgeInsets.all(45)),
            ),
          );
        },
      ),
      baseColor: Color.fromARGB(255, 233, 233, 233),
      highlightColor: Colors.white);
}

class LeagueSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<League> matchQuery = [];

    return FutureBuilder<LeaguesInfo>(
      future: FootballApiManager().getLeague(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (var item in snapshot.data!.leagues!) {
            if (item.leagueName!.toLowerCase().contains(query.toLowerCase())) {
              if (!Provider.of<TopBar>(context)
                  .listofLeagues
                  .contains(item.leagueId!)) {
                matchQuery.add(item);
              }
            }
          }
          return ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                return Leaguecard(
                  league: matchQuery[index],
                );
              });
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<League> matchQuery = [];

    return FutureBuilder<LeaguesInfo>(
      future: FootballApiManager().getLeague(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (var item in snapshot.data!.leagues!) {
            if (item.leagueName!.toLowerCase().contains(query.toLowerCase())) {
              if (!Provider.of<TopBar>(context)
                  .listofLeagues
                  .contains(item.leagueId!)) {
                matchQuery.add(item);
              }
            }
          }
          return ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                return Leaguecard(
                  league: matchQuery[index],
                );
              });
        } else {
          return shimmerEffectUIWidget();
        }
      },
    );
  }

  Widget shimmerEffectUIWidget() => Shimmer.fromColors(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(padding: EdgeInsets.all(30)),
          );
        },
      ),
      baseColor: Color.fromARGB(255, 233, 233, 233),
      highlightColor: Colors.white);
}
