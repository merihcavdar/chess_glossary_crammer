import 'package:flutter/material.dart';
import 'pages/main_screen.dart';
import '../model/db_helper.dart';
import '../model/term.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = ChessDatabasHelper();
  await db.init();
  final allTheTerms = await db.getAllTheTerms();
  runApp(ChessGlossary(allTheTerms));
}

class ChessGlossary extends StatelessWidget {
  final List<ChessTerm> allTheTerms;

  const ChessGlossary(this.allTheTerms, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Glossary Crammer',
      theme: ThemeData(
        fontFamily: 'Poppins-Bold',
        primarySwatch: Colors.brown,
      ),
      home:
          MainScreen(title: 'Chess Glossary Crammer', allTheTerms: allTheTerms),
    );
  }
}
