import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';

class ResultInfo extends StatelessWidget {
  const ResultInfo(this.question, this.givenAnswer, {Key? key})
      : super(key: key);

  final QuizQuestion question;
  final String givenAnswer;

  static const green = Colors.green;
  static const red = Colors.red;

  @override
  Widget build(BuildContext context) {
    bool correctAnswer = question.answers[0] == givenAnswer;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //The question number
          Stack(
            children: [
              //Draw a circle
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (correctAnswer ? green : red).withOpacity(0.7),
                ),
              ),
              //Draw the number
              Container(
                width: 35,
                height: 35,
                alignment: Alignment.center,
                child: Text(
                  "${questions.indexOf(question) + 1}",
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          //The column containing the question, the given answer and the correct answer
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //The question
                Text(
                  question.question,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                //The given answer
                Text(
                  givenAnswer,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 161, 56, 217)),
                ),
                //The correct answer
                Text(
                  question.answers[0],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 40, 94, 201)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
