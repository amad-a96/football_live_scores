import 'package:flutter/material.dart';

import 'package:football_live_scores/models/Leagues_Info.dart';

import 'package:football_live_scores/services/football_Api_Manager.dart';
import 'package:football_live_scores/widgets/result%20_and_fixture_card.dart';
import 'package:intl/intl.dart';
import 'package:isoweek/isoweek.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ResultsandFixturesScreen extends StatefulWidget {
  ResultsandFixturesScreen({Key? key}) : super(key: key);

  @override
  _ResultsandFixturesScreenState createState() =>
      _ResultsandFixturesScreenState();
}

class _ResultsandFixturesScreenState extends State<ResultsandFixturesScreen> {
  List leagues = [
    '152', //#152: Premier League
    '302', //#302: La Liga
    '207', //#207: Serie A
    '175', //#175: Bundesliga

    '168', //#168: Ligue 1
  ];
  String leagueId = '152';
  int nextWeekcount = 1;
  int previouseWeekcount = 1;
  List<DateTime> currentWeek = Week.current().days;
  Stream<LeaguesInfo>? _matchs;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  //print(_competitions);
  @override
  void initState() {
    super.initState();
    _matchs = FootballApiManager().getResultsandFixtures(currentWeek, leagueId);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: leagues.length,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Football Scores',
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
                child: TabBar(
                    indicatorWeight: 3,
                    indicatorColor: Colors.amber,
                    labelColor: Color.fromARGB(255, 39, 36, 63),
                    onTap: (value) {
                      print(value);
                      leagueId = leagues[value];
                      _matchs = FootballApiManager()
                          .getResultsandFixtures(currentWeek, leagueId);
                      setState(() {});
                    },
                    tabs: [
                      Container(
                          color: Colors.white,
                          child: Tab(
                              child: Image.asset('images/Premier League.png'))),
                      Tab(
                        child: Image.asset('images/laLiga.png'),
                      ),
                      Tab(
                        child: Image.asset('images/serieA.png'),
                      ),
                      Tab(
                        child: Image.asset('images/bundesliga.png'),
                      ),
                      Tab(
                        child: Image.asset('images/ligue1.png'),
                      )
                    ]),
              ),
              Expanded(
                child: StreamBuilder<LeaguesInfo>(
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
                          await Future.delayed(Duration(milliseconds: 3000))
                              .then((value) =>
                                  refreshController.refreshCompleted());

                          setState(() {});
                        },
                        onLoading: () async {
                          Week currentWeek = Week.current();
                          Week futureWeek = currentWeek.addWeeks(nextWeekcount);

                          _matchs = FootballApiManager()
                              .getResultsandFixtures(futureWeek.days, leagueId);
                          nextWeekcount++;
                          previouseWeekcount--;
                          await Future.delayed(Duration(milliseconds: 3000))
                              .then(
                                  (value) => refreshController.loadComplete());

                          setState(() {});
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
                                          // short MonthName
                                          DateFormat.MMMEd().format(snapshot
                                              .data!.matches![0].matchDate!),
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 117, 113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    : Container(),
                                ResultandFixtureCard(
                                  leaguesInfo: snapshot.data!,
                                  index: index,
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    } else
                      return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          )),
    );
  }
}

