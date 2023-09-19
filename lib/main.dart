import 'package:flutter/material.dart';
import 'quizz_brain.dart';

void main() {
  runApp(const Quizzler());
}

QuizBrain quizzBrain = new QuizBrain();

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
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
                        bool correctAnswer = quizzBrain.getAnswerFromBank();
                        if (correctAnswer == true) {
                          print('Answer is true');
                        } else {
                          print('Answer is wrong');
                        }
                        setState(() {
                          quizzBrain.setQuestionNumber();
                        });
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
                        bool correctAnswer = quizzBrain.getAnswerFromBank();
                        if (correctAnswer == false) {
                          print('Answer is false');
                        } else {
                          print('Answer is wrong');
                        }
                        setState(() {
                          quizzBrain.setQuestionNumber();
                        });
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
                  padding: const EdgeInsets.all(20.0),
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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text('10'),
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
      ),
    );
  }
}
