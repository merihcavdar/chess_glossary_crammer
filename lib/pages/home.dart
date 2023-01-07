import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../model/term.dart';
import '../model/db_helper.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FloatingSearchBarController controller;
  String selectedTerm = '';

  @override
  initState() {
    super.initState();
    controller = FloatingSearchBarController();
    getTheWords();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  getTheWords() async {
    final db = ChessDatabasHelper();
    await db.init();
    final allTheTerms = await db.getAllTheTerms();
    for (var term in allTheTerms) {}
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingSearchBar(
        clearQueryOnClose: true,
        openAxisAlignment: 0.0,
        axisAlignment: 0.0,
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
        elevation: 4.0,
        iconColor: const Color(0xfff0d9b5),
        accentColor: const Color(0xfff0d9b5),
        hintStyle: const TextStyle(
          color: Color(0xfff0d9b5),
        ),
        queryStyle: const TextStyle(
          color: Color(0xfff0d9b5),
        ),
        backgroundColor: Colors.brown,
        controller: controller,
        body: FloatingSearchBarScrollNotifier(
          child: SearchResultsListView(
            searchTerm: selectedTerm,
          ),
        ),
        transitionCurve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 500),
        transition: CircularFloatingSearchBarTransition(),
        debounceDelay: const Duration(milliseconds: 500),
        physics: const BouncingScrollPhysics(),
        title: Text(
          selectedTerm,
          style: const TextStyle(
            color: Color(0xfff0d9b5),
            fontSize: 20,
          ),
        ),
        hint: 'type a chess term...',
        showDrawerHamburger: false,
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print('Places Pressed');
              },
            ),
          ),
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        onQueryChanged: (query) async {
          print('searching a new term');
          setState(() {
            //filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: (query) {
          setState(() {
            //addSearchTerm(query);
            selectedTerm = query;
          });
          controller.close();
        },
        builder: (context, transition) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Column(
                children: const [Text('first item')],
              ));
        },
      ),
    );
  }
}

class SearchResultsListView extends StatefulWidget {
  final String searchTerm;

  const SearchResultsListView({
    key,
    @required this.searchTerm,
  }) : super(key: key);

  @override
  State<SearchResultsListView> createState() => _SearchResultsListViewState();
}

class _SearchResultsListViewState extends State<SearchResultsListView> {
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.searchTerm == '') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          InkWell(
            onTap: () {
              myFocusNode.requestFocus();
            },
            child: Column(
              children: const [
                Icon(
                  Icons.search,
                  size: 60,
                ),
                Text(
                  'Start searching',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Image(
            image: AssetImage('assets/cgc.png'),
            width: 200.0,
            height: 200.0,
          ),
        ],
      );
    }

    return ListView(
        padding: const EdgeInsets.only(top: 150.0),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('hello')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('hello')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('hello')),
          ),
        ]);
  }
}
