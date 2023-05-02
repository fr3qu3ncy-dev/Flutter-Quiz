import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {Key? key}) : super(key: key);

  final Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var _questionIndex = 0;

  void _nextQuestion(String chosenAnswer) {
    setState(() {
      widget.onSelectAnswer(chosenAnswer);
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_questionIndex];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.question,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 167, 154, 220),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion
              .getShuffledAnswers()
              .map((answer) => AnswerButton(
                    answerText: answer,
                    onTap: () {
                      _nextQuestion(answer);
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }
}
