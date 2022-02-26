import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:football_live_scores/models/Standings_Info.dart';
import 'package:transparent_image/transparent_image.dart';

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
        Container(
          color: widget.index! % 2 == 0
              ? Colors.white
              : Color.fromARGB(5, 39, 36, 63),
          height: MediaQuery.of(context).size.height * 0.09,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(standing.overallLeaguePosition!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CachedNetworkImage(
                          imageUrl: standing.teamBadge!,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        /* FadeInImage.memoryNetwork(
                            image: standing.teamBadge!,
                            placeholder: kTransparentImage,
                          )*/
                      ),
                    ),
                    Text(standing.teamName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(standing.overallLeaguePayed!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(standing.overallLeagueW!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(standing.overallLeagueD!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(standing.overallLeagueL!),
                    ),
                    Text(standing.overallLeagueGf!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                    Text(":",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                    Text(standing.overallLeagueGa!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(standing.overallLeaguePts!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
