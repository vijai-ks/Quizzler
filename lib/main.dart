import 'package:flutter/material.dart';
import 'quizz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    const MaterialApp(home: Quizzler()),
  );
}

QuizBrain quizzBrain = QuizBrain();

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scoreKeeper = [];
  int correctAnswers = 0;

  void checkAndUpdateAnswer(bool userSelection) {
    bool correctAnswer = quizzBrain.getAnswerFromBank();
    setState(() {
      if (quizzBrain.getTotalNumberOfQuestions() ==
          quizzBrain.getQuestionNumber()) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Quizzler ALERT",
          desc: "You have reached the end of the Quiz.",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: const Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        correctAnswers = 0;
        scoreKeeper.clear();
      }
      if (userSelection == correctAnswer) {
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        correctAnswers++;
      } else {
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      quizzBrain.setQuestionNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text('Quizzler'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizzBrain.getQuestionFromBank(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20.0, 10),
                  child: TextButton(
                    onPressed: () {
                      checkAndUpdateAnswer(true);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20.0, 10),
                  child: TextButton(
                    onPressed: () {
                      checkAndUpdateAnswer(true);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'Answer: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: 300,
                      height: 25,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: scoreKeeper,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Score: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text('$correctAnswers'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Current Question : ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        quizzBrain.getQuestionNumber().toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      const Text(
                        '/',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        quizzBrain.getTotalNumberOfQuestions().toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
