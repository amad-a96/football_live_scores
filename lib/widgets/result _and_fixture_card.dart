import 'package:flutter/material.dart';
import 'package:football_live_scores/models/Leagues_Info.dart';
import 'package:football_live_scores/screens/Lineup_Statistics_screen.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ResultandFixtureCard extends StatefulWidget {
  ResultandFixtureCard({Key? key, this.leaguesInfo, this.index})
      : super(key: key);
  LeaguesInfo? leaguesInfo;
  int? index;

  @override
  State<ResultandFixtureCard> createState() => _ResultandFixtureCardState();
}

class _ResultandFixtureCardState extends State<ResultandFixtureCard> {
  bool dateshow = true;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    var league = widget.leaguesInfo!.matches![widget.index!];
    var date =
        widget.leaguesInfo!.matches![widget.index!].matchDate!.toString();
    var newdate = widget.leaguesInfo!
        .matches![widget.index! - 1 == -1 ? 0 : widget.index! - 1].matchDate!
        .toString();
    if (date == newdate) {
      dateshow = false;
    } else {
      newdate = date;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          dateshow
              ? Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text(
                    DateFormat.MMMMEEEEd().format(league.matchDate!),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 66, 117, 113),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                )
              : Container(),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: league.teamHomeBadge!,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                /*FadeInImage.memoryNetwork(
                                  imageErrorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    // Appropriate logging or analytics, e.g.
                                    // myAnalytics.recordError(
                                    //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                                    //   exception,
                                    //   stackTrace,
                                    // );
                                    return const Text('Loading...');
                                  },
                                  image: league.teamHomeBadge!,
                                  placeholder: kTransparentImage,
                                  fit: BoxFit.fill,
                                ),*/
                              ),
                            ),
                            Expanded(
                              child: Text(
                                league.matchHometeamName!,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 72, 66, 117),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  league.matchHometeamScore!,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 72, 66, 117),
                                      fontSize: 26,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  league.matchStatus != ''
                                      ? "  -  "
                                      : league.matchTime!,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 72, 66, 117),
                                      fontSize: 26,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  league.matchAwayteamScore!,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 72, 66, 117),
                                      fontSize: 26,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              league.matchStatus != ''
                                  ? league.matchStatus! + '\''
                                  : '',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 196, 77, 113),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: league.teamAwayBadge!,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                /* FadeInImage.memoryNetwork(
                                  imageErrorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
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
                                ),*/
                              ),
                            ),
                            Expanded(
                              child: Text(league.matchAwayteamName!,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 72, 66, 117),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
