import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopBar extends ChangeNotifier {
  final String _leaguesIDkey = " leaguesID";
  final String _leagueslogokey = " leagueslogo";
  SharedPreferences? _preferences;
  final List<String> _leagueslogo = [];
  final List<String> _leaguesID = [];
  final List<String> _leagues = [
    '152', //#152: Premier League
    '302', //#302: La Liga
    '207', //#207: Serie A
    '175', //#175: Bundesliga
    '168', //#168: Ligue 1
  ];

  final List<Widget> _tabsWidgets = [
    Tab(child: Image.asset('images/Premier League.png')),
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
    ),
  ];
  List<String> get listofLeagues => _leagues.toList();

  List<Widget> get listofWidgets => _tabsWidgets.toList();

  void addLeague(leagueId, leagueLogo) {
    _leagues.add(leagueId);
    _tabsWidgets.add(Tab(
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: leagueLogo,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    ));
    _leaguesID.add(leagueId);
    _leagueslogo.add(leagueLogo);

    _savePreferences();
    notifyListeners();
  }

  _initialPreferences() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  _savePreferences() async {
    await _initialPreferences();
    _preferences!.setStringList(_leaguesIDkey, _leaguesID);
    _preferences!.setStringList(_leagueslogokey, _leagueslogo);
  }

  loadFromPreferences() async {
    await _initialPreferences();
    _leaguesID.clear();
    _leagueslogo.clear();
    List leaguesID = _preferences!.getStringList(_leaguesIDkey) ?? [];
    List leagueslogo = _preferences!.getStringList(_leagueslogokey) ?? [];
    int len = leaguesID.length;
    print(len);
    print('-=0=0=-=-=-=-=-=-=-=-=-=-=-=-=-');
    for (var i = 0; i < len; i++) {
      addLeague(leaguesID[i], leagueslogo[i]);
      print(i);
    }
  }
}
