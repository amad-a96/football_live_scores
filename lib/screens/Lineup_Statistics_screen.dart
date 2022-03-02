import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_live_scores/models/Matches_Info.dart';
import 'package:football_live_scores/widgets/result%20_and_fixture_card.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LineupStatisticScreen extends StatefulWidget {
  LineupStatisticScreen({Key? key, this.matchesInfo, this.index})
      : super(key: key);

  MatchesInfo? matchesInfo;
  int? index;
  @override
  _LineupStatisticScreenState createState() => _LineupStatisticScreenState();
}

class _LineupStatisticScreenState extends State<LineupStatisticScreen> {
  // List<Statistic> statistic = [];

  int? viewType = 0;
  @override
  Widget build(BuildContext context) {
    var statistic = widget.matchesInfo!.matches![widget.index!].statistics;
    var lineup = widget.matchesInfo!.matches![widget.index!].lineup;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 39, 36, 63),
          centerTitle: true,
          title: Text(widget.matchesInfo!.matches![widget.index!].leagueName!,
              style: const TextStyle(
                color: Colors.white,
              )),
        ),
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
                    bottom: -50,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl: widget
                                              .matchesInfo!
                                              .matches![widget.index!]
                                              .teamHomeBadge!,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          widget
                                              .matchesInfo!
                                              .matches![widget.index!]
                                              .matchHometeamName!,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 72, 66, 117),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          widget
                                              .matchesInfo!
                                              .matches![widget.index!]
                                              .matchHometeamSystem!,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 72, 66, 117),
                                              fontSize: 14,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget
                                                .matchesInfo!
                                                .matches![widget.index!]
                                                .matchHometeamScore!,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 72, 66, 117),
                                                fontSize: 26,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            widget
                                                        .matchesInfo!
                                                        .matches![widget.index!]
                                                        .matchStatus !=
                                                    ''
                                                ? "  -  "
                                                : widget
                                                    .matchesInfo!
                                                    .matches![widget.index!]
                                                    .matchTime!,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 72, 66, 117),
                                                fontSize: 26,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            widget
                                                .matchesInfo!
                                                .matches![widget.index!]
                                                .matchAwayteamScore!,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 72, 66, 117),
                                                fontSize: 26,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        widget
                                                    .matchesInfo!
                                                    .matches![widget.index!]
                                                    .matchStatus !=
                                                ''
                                            ? widget
                                                    .matchesInfo!
                                                    .matches![widget.index!]
                                                    .matchStatus! +
                                                '\''
                                            : '',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 196, 77, 113),
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
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl: widget
                                              .matchesInfo!
                                              .matches![widget.index!]
                                              .teamAwayBadge!,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                            widget
                                                .matchesInfo!
                                                .matches![widget.index!]
                                                .matchAwayteamName!,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 72, 66, 117),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          widget
                                              .matchesInfo!
                                              .matches![widget.index!]
                                              .matchAwayteamSystem!,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 72, 66, 117),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
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
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              TabBar(
                  indicatorWeight: 3,
                  indicatorColor: Color.fromARGB(255, 39, 36, 63),
                  labelColor: Color.fromARGB(255, 39, 36, 63),
                  onTap: (value) {
                    print(value);
                    viewType = value;
                    setState(() {});
                  },
                  tabs: const [
                    Tab(
                      child: Text(
                        'Statistics',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'lineup',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
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
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              color: Color.fromARGB(237, 0, 0, 0),
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: lineup.home!.coach!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Coaching',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              lineup.home!.coach![0].lineupPlayer!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              lineup.away!.coach![0].lineupPlayer!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://c4.wallpaperflare.com/wallpaper/497/938/519/grass-football-field-green-lawn-wallpaper-thumb.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                color: Color.fromARGB(200, 0, 0, 0),
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: lineup.home!.startingLineups!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index == 0
                            ? Container(
                                width: double.infinity,
                                color: Color.fromARGB(129, 0, 0, 0),
                                child: const Padding(
                                  padding: EdgeInsets.all(28.0),
                                  child: Center(
                                    child: Text(
                                      'Lineups',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  lineup.home!.startingLineups![index]
                                      .lineupNumber!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    lineup.home!.startingLineups![index]
                                        .lineupPlayer!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    lineup.away!.startingLineups![index]
                                        .lineupPlayer!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  lineup.away!.startingLineups![index]
                                      .lineupNumber!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black45,
                          thickness: 1,
                        )
                      ],
                    );
                  },
                ),
              ),
            ),

            //////////////////////

            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://whsports.nl/en/wp-content/uploads/sites/3/2019/02/dugouts-for-stadiums-5.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Color.fromARGB(200, 0, 0, 0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: lineup.home!.substitutes!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index == 0
                            ? Container(
                                width: double.infinity,
                                color: Color.fromARGB(129, 0, 0, 0),
                                padding: const EdgeInsets.all(28.0),
                                child: const Center(
                                  child: Text('substitutes',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                ),
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
                                      lineup.home!.substitutes![index]
                                          .lineupNumber!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        lineup.home!.substitutes![index]
                                            .lineupPlayer!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                    lineup.away!.substitutes![index]
                                        .lineupPlayer!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      lineup.away!.substitutes![index]
                                          .lineupNumber!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black45,
                          thickness: 1,
                        )
                      ],
                    );
                  },
                ),
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
      ),
    );
  }

  Expanded statisticsListView(List<Statistic> statistic) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
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
                              fontWeight:
                                  a > h ? FontWeight.w400 : FontWeight.w700,
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
                              fontWeight:
                                  a < h ? FontWeight.w400 : FontWeight.w700,
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
      ),
    );
  }
}
