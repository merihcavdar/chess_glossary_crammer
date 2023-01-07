import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class FlashCardsPage extends StatefulWidget {
  const FlashCardsPage({key}) : super(key: key);

  @override
  State<FlashCardsPage> createState() => _FlashCardsPageState();
}

class _FlashCardsPageState extends State<FlashCardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flashcards',
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, //.horizontal
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'advanced pawn',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      // ignore: prefer_adjacent_string_concatenation
                      "A pawn that is on the opponent's half of the board (the fifth rank or higher). An advanced pawn may be weak if it is overextended, lacking support and difficult" +
                          "to defend, or strong if it cramps the enemy by limiting mobility. An advanced passed " +
                          "pawn that threatens to promote can be especially strong.",
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 20.0,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    const Image(
                      image: AssetImage('assets/img/ex_1.png'),
                      width: 400.0,
                      height: 400.0,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Add/remove to/from favorites',
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                        LikeButton(
                          size: 30,
                          circleColor: const CircleColor(
                            start: Colors.pink,
                            end: Colors.red,
                          ),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Colors.pink,
                            dotSecondaryColor: Colors.red,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color: isLiked ? Colors.red : Colors.grey,
                              size: 30,
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
