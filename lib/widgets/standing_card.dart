import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:football_live_scores/models/Standings_Info.dart';

class StandingCard extends StatefulWidget {
  StandingCard({Key? key, this.standingsInfo, this.index}) : super(key: key);
  StandingsInfo? standingsInfo;
  int? index;

  @override
  State<StandingCard> createState() => _StandingCardState();
}

class _StandingCardState extends State<StandingCard> {
  @override
  Widget build(BuildContext context) {
    var standing = widget.standingsInfo!.standings![widget.index!];
    return Column(
      children: [
        widget.index == 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('P',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 172, 146, 235),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('W',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 79, 193, 232),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('D',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 160, 213, 104),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('L',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 206, 84),
                        )),
                  ),
                  Text('Gf',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 237, 85, 100),
                      )),
                  Text(":",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 237, 85, 100),
                      )),
                  Text('Ga',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 237, 85, 100),
                      )),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('PTS',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 72, 66, 117),
                          fontSize: 14,
                        )),
                  ),
                ],
              )
            : Container(),
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.09,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 3,
                      color: standing.overallPromotion!
                              .contains('Champions League')
                          ? Color.fromARGB(255, 54, 82, 244)
                          : standing.overallPromotion!.contains('Europa League')
                              ? Color.fromARGB(255, 255, 136, 0)
                              : standing.overallPromotion!
                                      .contains('Europa Conference League')
                                  ? Color.fromARGB(255, 13, 126, 41)
                                  : standing.overallPromotion!
                                          .contains('Relegation')
                                      ? Color.fromARGB(255, 244, 54, 54)
                                      : Colors.transparent,
                    ),
                    Container(
                      width: 25,
                      child: Center(
                        child: Text(standing.overallLeaguePosition!,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 72, 66, 117),
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: standing.teamBadge!,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Text(
                      standing.teamName!,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 72, 66, 117),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 20,
                        child: Center(
                          child: Text(
                            standing.overallLeaguePayed!,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 172, 146, 235),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                      child: Center(
                        child: Text(
                          standing.overallLeagueW!,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 79, 193, 232),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                      child: Center(
                        child: Text(
                          standing.overallLeagueD!,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 160, 213, 104),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                      child: Center(
                        child: Text(
                          standing.overallLeagueL!,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 206, 84),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            standing.overallLeagueGf!,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 237, 85, 100),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(
                                color: Color.fromARGB(255, 237, 85, 100),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            standing.overallLeagueGa!,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 237, 85, 100),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 20,
                        child: Center(
                          child: Text(
                            standing.overallLeaguePts!,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 72, 66, 117),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}
