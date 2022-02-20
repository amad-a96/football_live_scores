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
  List<Statistic> statistic = [];

  Color statisticsButtonColor = Colors.white;
  Color lineupButtonColor = Colors.transparent;
  String? listViewType = 'statistics';
  @override
  Widget build(BuildContext context) {
    var statistic = widget.leaguesInfo!.matches![widget.index!].statistics;
    var lineup = widget.leaguesInfo!.matches![widget.index!].lineup;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              child: ResultandFixtureCard(
                leaguesInfo: widget.leaguesInfo,
                index: widget.index,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0)),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Row(children: [
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                backgroundColor: statisticsButtonColor),
                            onPressed: () {
                              statisticsButtonColor = Colors.white;
                              lineupButtonColor = Colors.transparent;
                              listViewType = 'spend';
                              setState(() {});
                            },
                            child: const Text(
                              "Statistics",
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                backgroundColor: lineupButtonColor),
                            onPressed: () {
                              statisticsButtonColor = Colors.transparent;
                              lineupButtonColor = Colors.white;
                              listViewType = 'lineup';
                              setState(() {});
                            },
                            child: const Text(
                              "lineup",
                            )),
                      ),
                    ]),
                  )),
            ),
            listViewType != 'lineup'
                ? statisticsListView(statistic!)
                : linupListView(lineup!),
          ],
        ),
      ),
    );
  }

  Expanded linupListView(Lineup lineup) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: lineup.home!.startingLineups!.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(lineup.home!.startingLineups![index].lineupNumber
                        .toString()),
                    Text(lineup.home!.startingLineups![index].lineupPlayer
                        .toString()),
                  ],
                ),
                Row(
                  children: [
                    Text(lineup.away!.startingLineups![index].lineupPlayer
                        .toString()),
                    Text(lineup.away!.startingLineups![index].lineupNumber
                        .toString()),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Expanded statisticsListView(List<Statistic> statistic) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: statistic.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(statistic[index].home.toString()),
                    Column(
                      children: [
                        Text(statistic[index].type.toString()),
                        Row(
                          children: [
                            LinearPercentIndicator(
                              isRTL: true,
                              width: 100.0,
                              lineHeight: 14.0,
                              percent: 0.5,
                              backgroundColor: Colors.grey,
                              progressColor: Colors.red,
                            ),
                            LinearPercentIndicator(
                              width: 100.0,
                              lineHeight: 14.0,
                              percent: 0.5,
                              backgroundColor: Colors.grey,
                              progressColor: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(statistic[index].away.toString()),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
