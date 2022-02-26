import 'package:flutter/material.dart';
import 'package:football_live_scores/screens/Results_and_Fixtures_Screen.dart';
import 'package:football_live_scores/screens/standings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  //ScoresApi a = ScoresApi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MainScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/MyScreen': (context) => StandingsScreen(),
      },
      title: 'Flutter Demo',
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List screens = [
    ResultsandFixturesScreen(),
    StandingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Scores',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_numbered_outlined),
              label: 'Standings',
            ),
            /* BottomNavigationBarItem(
              icon: Icon(Icons.blur_circular_sharp),
              label: 'Top Scores',
            ),*/
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 39, 36, 63),
          onTap: _onItemTapped
          /*(index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, "/");
              break;
            case 1:
              Navigator.pushNamed(context, "/MyScreen");
              break;
          }
        },*/
          // type: BottomNavigationBarType.fixed,
          ),
    );
  }
}
