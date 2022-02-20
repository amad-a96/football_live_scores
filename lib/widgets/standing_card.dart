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
    return Card(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(standing.overallLeaguePosition!),
          AspectRatio(
              aspectRatio: 1,
              child: FadeInImage.memoryNetwork(
                image: standing.teamBadge!,
                placeholder: kTransparentImage,
              )),
          Text(standing.teamName!),
          Text(standing.overallLeaguePayed!),
          Text("  "),
          Text(standing.overallLeagueW!),
          Text("  "),
          Text(standing.overallLeagueD!),
          Text("  "),
          Text(standing.overallLeagueL!),
          Text("  "),
          Text(standing.overallLeagueGf!),
          Text(":"),
          Text(standing.overallLeagueGa!),
          Text("  "),
          Text(standing.overallLeaguePts!),
        ],
      ),
    ));
  }
}
