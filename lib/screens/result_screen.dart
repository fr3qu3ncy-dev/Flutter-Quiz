import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/result_info.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.answers, this.restartQuiz, {Key? key})
      : super(key: key);

  final List<String> answers;
  final Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    final totalAnswers = answers.length;
    final correctAnswers = questions
        .where((element) =>
            element.answers[0] == answers[questions.indexOf(element)])
        .length;

    return Padding(
      padding: const EdgeInsets.only(top: 125),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "You answered $correctAnswers out of $totalAnswers questions correctly!",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 167, 154, 220),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...questions
                      .map((e) => ResultInfo(e, answers[questions.indexOf(e)]))
                      .toList(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: restartQuiz,
                icon: const Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
                label: const Text(
                  "Restart Quiz!",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
