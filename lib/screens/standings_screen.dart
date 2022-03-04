import 'package:flutter/material.dart';
import 'package:football_live_scores/models/Standings_Info.dart';
import 'package:football_live_scores/services/football_Api_Manager.dart';
import 'package:football_live_scores/widgets/Standing_Card.dart';
import 'package:provider/provider.dart';

import '../provider/Topbar_navigation_provider.dart';

class StandingsScreen extends StatefulWidget {
  const StandingsScreen({Key? key}) : super(key: key);

  @override
  _StandingsScreenState createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  String leagueId = '152';
  Stream<StandingsInfo>? _stadings;
  @override
  void initState() {
    super.initState();
    _stadings = FootballApiManager().getStandings(leagueId);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Provider.of<TopBar>(context).listofLeagues.length,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:
                Text('Football Scores', style: TextStyle(color: Colors.white)),
            elevation: 0,
            //backgroundColor: Colors.transparent,

            backgroundColor: Color.fromARGB(255, 39, 36, 63),
          ),
          body: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 39, 36, 63),
                height: 80,
                child: TabBar(
                    isScrollable: true,
                    indicatorWeight: 3,
                    indicatorColor: Colors.amber,
                    labelColor: Color.fromARGB(255, 39, 36, 63),
                    onTap: (value) {
                      print(value);
                      leagueId = Provider.of<TopBar>(context, listen: false)
                          .listofLeagues[value];

                      setState(() {
                        _stadings = FootballApiManager().getStandings(leagueId);
                      });
                    },
                    tabs: Provider.of<TopBar>(context).listofWidgets),
              ),
              Expanded(
                child: StreamBuilder<StandingsInfo>(
                  stream: _stadings,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data!.standings!.length,
                        itemBuilder: (context, index) {
                          return StandingCard(
                            standingsInfo: snapshot.data!,
                            index: index,
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          )),
    );
  }
}
