import 'package:flutter/material.dart';
import 'package:football_live_scores/models/Standings_Info.dart';
import 'package:football_live_scores/services/football_Api_Manager.dart';
import 'package:football_live_scores/widgets/Standing_Card.dart';

class StandingsScreen extends StatefulWidget {
  const StandingsScreen({Key? key}) : super(key: key);

  @override
  _StandingsScreenState createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  List leagues = [
    '152', //#152: Premier League
    '302', //#302: La Liga
    '207', //#207: Serie A
    '175', //#175: Bundesliga

    '168', //#168: Ligue 1
  ];
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
      length: leagues.length,
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
                    indicatorWeight: 3,
                    indicatorColor: Colors.amber,
                    labelColor: Color.fromARGB(255, 39, 36, 63),
                    onTap: (value) {
                      print(value);
                      leagueId = leagues[value];
                      _stadings = FootballApiManager().getStandings(leagueId);
                      setState(() {});
                    },
                    tabs: [
                      Container(
                          color: Colors.white,
                          child: Tab(
                              child: Image.asset('images/Premier League.png'))),
                      Tab(
                        child: Image.asset('images/laLiga.png'),
                      ),
                      Tab(
                        child: Image.asset('images/serieA.png'),
                      ),
                      Tab(
                        child: Image.asset('images/bundesliga.png'),
                      ),
                      Tab(
                        child: Image.asset('images/ligue1.png'),
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text('P',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text('W',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text('D',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text('L',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Text('Gf',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                    Text(":",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                    Text('Ga',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text('PTS',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ],
                ),
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
