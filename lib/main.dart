import 'package:flutter/material.dart';

void main() {
  runApp(const Quizzler());
}

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
                const Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'This is where the question text will go',
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
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
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.red,
                          ),
                        );
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Container(
                    child: const Row(
                      children: [
                        Text(
                          'Score: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text('10'),
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
