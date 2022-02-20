import 'package:flutter/material.dart';
import 'package:football_live_scores/models/Leagues_Info.dart';
import 'package:football_live_scores/screens/Lineup_Statistics_screen.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class ResultandFixtureCard extends StatefulWidget {
  ResultandFixtureCard({Key? key, this.leaguesInfo, this.index})
      : super(key: key);
  LeaguesInfo? leaguesInfo;
  int? index;

  @override
  State<ResultandFixtureCard> createState() => _ResultandFixtureCardState();
}

class _ResultandFixtureCardState extends State<ResultandFixtureCard> {
  @override
  Widget build(BuildContext context) {
    var league = widget.leaguesInfo!.matches![widget.index!];
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LineupStatisticScreen(
                leaguesInfo: widget.leaguesInfo,
                index: widget.index,
              ),
            ),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: FadeInImage.memoryNetwork(
                            image: league.teamHomeBadge!,
                            placeholder: kTransparentImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Text(league.matchHometeamName!),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(league.matchHometeamScore!),
                        Text(league.matchStatus != ''
                            ? "-"
                            : DateFormat('dd MMM')
                                .format(
                                  league.matchDate!,
                                )
                                .toString()),
                        Text(league.matchAwayteamScore!),
                      ],
                    ),
                    Text(league.matchStatus != ''
                        ? league.matchStatus!
                        : league.matchTime!.toString()),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: FadeInImage.memoryNetwork(
                            imageErrorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              // Appropriate logging or analytics, e.g.
                              // myAnalytics.recordError(
                              //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                              //   exception,
                              //   stackTrace,
                              // );
                              return const Text('Loading...');
                            },
                            image: league.teamAwayBadge!,
                            placeholder: kTransparentImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Text(league.matchAwayteamName!),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
