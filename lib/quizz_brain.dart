import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  // To increment the question number to next question
  void setQuestionNumber() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  // Method to reset the question number to 0
  void resetQuestionNumber() {
    _questionNumber = 0;
  }

  // This method checks if this is the last question and returns true when the condition is true.
  bool isResetQuestions() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    }
    return false;
  }

  // It returns the current question number
  int getQuestionNumber() {
    return _questionNumber + 1;
  }

  // It returns the count of total questions
  int getTotalNumberOfQuestions() {
    return _questionBank.length;
  }

  // Since the question bank values are private we cant access it directly
  // For that we are creating two functions to return Question and Answer
  String getQuestionFromBank() {
    return _questionBank[_questionNumber].question;
  }

  // It returns the answer for the current question
  bool getAnswerFromBank() {
    return _questionBank[_questionNumber].answer;
  }
}
