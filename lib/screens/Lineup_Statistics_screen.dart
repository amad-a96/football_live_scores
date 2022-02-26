import 'package:flutter/material.dart';
import 'package:football_live_scores/models/Leagues_Info.dart';
import 'package:football_live_scores/widgets/result%20_and_fixture_card.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LineupStatisticScreen extends StatefulWidget {
  LineupStatisticScreen({Key? key, this.leaguesInfo, this.index})
      : super(key: key);

  LeaguesInfo? leaguesInfo;
  int? index;
  @override
  _LineupStatisticScreenState createState() => _LineupStatisticScreenState();
}

class _LineupStatisticScreenState extends State<LineupStatisticScreen> {
  // List<Statistic> statistic = [];

  int? viewType = 0;
  @override
  Widget build(BuildContext context) {
    var statistic = widget.leaguesInfo!.matches![widget.index!].statistics;
    var lineup = widget.leaguesInfo!.matches![widget.index!].lineup;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    color: Color.fromARGB(255, 39, 36, 63),
                    height: 130,
                  ),
                  Positioned(
                    bottom: -40,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: ResultandFixtureCard(
                        leaguesInfo: widget.leaguesInfo,
                        index: widget.index,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 30,
                    child: Center(
                      child: Text(
                          widget
                              .leaguesInfo!.matches![widget.index!].leagueName!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TabBar(
                  indicatorColor: Color.fromARGB(255, 39, 36, 63),
                  labelColor: Color.fromARGB(255, 39, 36, 63),
                  onTap: (value) {
                    print(value);
                    viewType = value;
                    setState(() {});
                  },
                  tabs: const [
                    Tab(
                      text: 'Statistics',
                    ),
                    Tab(
                      text: 'lineup',
                    )
                  ]),
              viewType == 0
                  ? statisticsListView(statistic!)
                  : linupListView(lineup!),
            ],
          ),
        ),
      ),
    );
  }

  Expanded linupListView(Lineup lineup) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Card(
            elevation: 0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: lineup.home!.coach!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Coaching',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            lineup.home!.coach![0].lineupPlayer!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            lineup.away!.coach![0].lineupPlayer!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Card(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: lineup.home!.startingLineups!.length,
              itemBuilder: (context, index) {
                return Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index == 0
                        ? const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Lineups',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54)),
                          )
                        : Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              lineup
                                  .home!.startingLineups![index].lineupNumber!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                lineup.home!.startingLineups![index]
                                    .lineupPlayer!,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              lineup
                                  .away!.startingLineups![index].lineupPlayer!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                lineup.away!.startingLineups![index]
                                    .lineupNumber!,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),

          //////////////////////

          Card(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: lineup.home!.substitutes!.length,
              itemBuilder: (context, index) {
                return Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index == 0
                        ? const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('substitutes',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54)),
                          )
                        : Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  lineup
                                      .home!.substitutes![index].lineupNumber!,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    lineup.home!.substitutes![index]
                                        .lineupPlayer!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(lineup.away!.substitutes![index].lineupPlayer!,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  lineup
                                      .away!.substitutes![index].lineupNumber!,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
          //////////////////

          Card(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: lineup.home!.missingPlayers!.length,
              itemBuilder: (context, index) {
                return Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index == 0
                        ? const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('missing',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54)),
                          )
                        : Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                    lineup.home!.missingPlayers![index]
                                        .lineupNumber!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    lineup.home!.missingPlayers![index]
                                        .lineupPlayer!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(lineup
                                .away!.missingPlayers![index].lineupPlayer!),
                            Text(lineup
                                .away!.missingPlayers![index].lineupNumber!),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Expanded statisticsListView(List<Statistic> statistic) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: statistic.length,
          itemBuilder: (context, index) {
            double home = double.parse(
                statistic[index].home!.replaceAll(RegExp('%'), ''));
            double away = double.parse(
                statistic[index].away!.replaceAll(RegExp('%'), ''));
            double h = home / (home + away);
            double a = away / (away + home);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        statistic[index].home!,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: a > h
                                ? Color.fromARGB(255, 83, 122, 96)
                                : Color.fromARGB(255, 72, 66, 117),
                            fontSize: 16),
                      ),
                      Text(
                        statistic[index].type!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                      Text(
                        statistic[index].away!,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: a < h
                                ? Color.fromARGB(255, 83, 122, 96)
                                : Color.fromARGB(255, 72, 66, 117),
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width * 0.4,
                          isRTL: true,
                          lineHeight: 10.0,
                          percent: h,
                          backgroundColor: a > h
                              ? Color.fromARGB(108, 51, 117, 76)
                              : Color.fromARGB(108, 72, 66, 117),
                          progressColor: a > h
                              ? Color.fromARGB(255, 83, 122, 96)
                              : Color.fromARGB(255, 72, 66, 117),
                        ),
                        LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width * 0.4,
                          lineHeight: 10.0,
                          percent: a,
                          backgroundColor: a < h
                              ? Color.fromARGB(108, 51, 117, 76)
                              : Color.fromARGB(108, 72, 66, 117),
                          progressColor: a < h
                              ? Color.fromARGB(255, 51, 117, 76)
                              : Color.fromARGB(255, 72, 66, 117),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
