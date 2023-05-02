import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.onButtonPress, {Key? key}) : super(key: key);

  //create a void function

  final Function() onButtonPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 175),
      child: Column(
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            color: Colors.white.withOpacity(0.65),
            width: 300,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            onPressed: onButtonPress,
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.only(
                    left: 20, right: 30, top: 15, bottom: 15),
                side:
                const BorderSide(color: Colors.white, width: 3)),
            label: const Text(
              "Start Quiz",
            ),
            icon: const Icon(Icons.play_arrow),
          )
        ],
      ),
    );
  }
}
