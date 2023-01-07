import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './flashcards.dart';
import './history.dart';
import './home.dart';
import './quiz.dart';
import '../model/term.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({key, @required this.title, @required this.allTheTerms})
      : super(key: key);

  final String title;
  final List<ChessTerm> allTheTerms;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    QuizPage(),
    FlashCardsPage(),
    HistoryPage(),
  ];

  void _changeTab(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _widgetOptions.elementAt(_page),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Column(
            children: const [
              Icon(
                Icons.search,
                size: 30,
                color: Colors.brown,
              ),
              Text(
                'Search',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Icon(
                Icons.quiz,
                size: 30,
                color: Colors.brown,
              ),
              Text(
                'Exam',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Icon(
                Icons.card_membership,
                size: 30,
                color: Colors.brown,
              ),
              Text(
                'Flashcards',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Icon(
                Icons.history,
                size: 30,
                color: Colors.brown,
              ),
              Text(
                'History',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: const Color(0xffefebe9),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _changeTab(index);
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
