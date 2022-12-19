// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(
    this.questionText,
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
      '''1.Что хотел получить в подарок Малыш в мультфильме «Малыш и Карлсон»?''',
      [
        Answer('Велосипед', false),
        Answer('Собаку', true),
        Answer('Книгу о приведениях', false),
      ],
    ),
  );

  list.add(
    Question(
      '''2.Где работал крокодил Гена в мультфильме «Чебурашка и крокодил Гена»?	''',
      [
        Answer('В зоопарке', true),
        Answer('В бюро находок', false),
        Answer('В магазине', false),
      ],
    ),
  );
  list.add(
    Question(
      '''3.Как зовут подружку Лоло в мультфильме «Приключения пингвинёнка Лоло»?	''',
      [
        Answer('Тото', false),
        Answer('Meme', false),
        Answer('Pepe', true),
      ],
    ),
  );
  list.add(
    Question(
      '''4.Что написано на табличке возле дома Пятачка из мультфильма «Винни-Пух»?''',
      [
        Answer('Посторонним В', true),
        Answer('Добро пожаловать', false),
        Answer('Приходите еще', false),
      ],
    ),
  );
  list.add(
    Question(
      '''5. Лучший друг Винни-Пуха	''',
      [
        Answer('Masha', false),
        Answer('Pyatachok', true),
        Answer('lisa', false),
      ],
    ),
  );
  list.add(
    Question(
      '''6.Куда пыталась позвонить Фрекен Бок, когда встретилась с «милым приведением» Карлсоном?	''',
      [
        Answer('На телевидение', true),
        Answer('В больницу', false),
        Answer('В больницу', false),
      ],
    ),
  );
  list.add(
    Question(
      '''7. На каком музыкальном инструменте играл пёс в мультфильме «Бременские музыканты»?	''',
      [
        Answer('Бас-гитара', true),
        Answer('Baraban', false),
        Answer('Балалайка', false),
      ],
    ),
  );

  

  return list;
}
