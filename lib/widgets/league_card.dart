import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_live_scores/models/Leagues_info.dart';
import 'package:provider/provider.dart';

import '../models/Leagues_info.dart';
import '../provider/Topbar_navigation_provider.dart';

class Leaguecard extends StatefulWidget {
  Leaguecard({Key? key, required this.league}) : super(key: key);
  final league;
  @override
  State<Leaguecard> createState() => _LeaguecardState();
}

class _LeaguecardState extends State<Leaguecard> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: CachedNetworkImage(
            width: 50,
            height: 50,
            fit: BoxFit.fill,
            imageUrl: widget.league!.leagueLogo!,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          title: Text(widget.league!.leagueName!),
          subtitle: Text(widget.league!.countryName!),
          trailing: IconButton(
            onPressed: () {
              isAdded == false
                  ? setState(() {
                      isAdded = true;
                      Provider.of<TopBar>(context, listen: false).addLeague(
                          widget.league.leagueId, widget.league.leagueLogo);
                    })
                  : null;
            },
            icon:
                Icon(isAdded ? Icons.check_box : Icons.check_box_outline_blank),
          )),
    );
  }
}
