// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  final String img;
  final List<Answer> answerList;

  Question(
    this.img,
    this.answerList,
  );
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(
    Question(
      'assets/images/golli.jpg',
      [
        Answer('Hollywood', true),
        Answer('Grand Pass', false),
        Answer('Hyuston', false),
      ],
    ),
  );

  list.add(
    Question(
      'assets/images/chicago.jpg',
      [
        Answer('Chicago', true),
        Answer('New York', false),
        Answer('London', false),
      ],
    ),
  );
  list.add(
    Question(
      'assets/images/washington.jpg',
      [
        Answer('Holywood', false),
        Answer('Chicago', false),
        Answer('Washington', true),
      ],
    ),
  );
  list.add(
    Question(
      'assets/images/ny.jpg',
      [
        Answer('New York', true),
        Answer('Sietl', false),
        Answer('Detroit', false),
      ],
    ),
  );
  list.add(
    Question(
      'assets/images/miamibeech.jpg',
      [
        Answer('Boston', false),
        Answer('Miamibeech', true),
        Answer('Vegas', false),
      ],
    ),
  );
  list.add(
    Question(
    'assets/images/golli.jpg',
      [
        Answer('Hollywood', true),
        Answer('Hyuston', false),
        Answer('San Fransicko', false),
      ],
    ),
  );
  list.add(
    Question(
      'assets/images/ny.jpg',
      [
        Answer('New York', true),
        Answer('Barbados', false),
        Answer('Stuttgart', false),
      ],
    ),
  );

  

  return list;
}
