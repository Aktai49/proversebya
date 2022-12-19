import 'package:flutter/material.dart';
import 'package:proversebya/Question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
                child: UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color:
                   Color.fromARGB(255, 13, 34, 103)),
              accountName: Text(
                'Aizada Aktai',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                'aku@gmail.com',
                style: TextStyle(fontSize: 18, 
                color: Colors.white),
              ),
              currentAccountPicture: Padding(
                padding: EdgeInsets.all(12.0),
                child: CircleAvatar(
                  radius: 85,
                  backgroundImage: AssetImage(
                    'assets/images/luvr.jpg'),
                ),
              ),
            )),
            ListTile(title: const Text("Логика"), onTap: () {}),
            ListTile(title: const Text("Память"), onTap: () {}),
            ListTile(title: const Text("Окружающий мир"), onTap: () {}),
            ListTile(title: const Text("Загадки"), onTap: () {}),
            ListTile(title: const Text("Математика"), onTap: () {}),
            ListTile(title: const Text("Кроссворд"), onTap: () {}),
            ListTile(title: const Text("English"), onTap: () {}),
            ListTile(title: const Text("Мои достижения "), onTap: () {}),
          ],
        ),
      ),

    

      backgroundColor: const Color.fromARGB(255, 3, 32, 55),

      appBar: AppBar(
        title: const Text('"EduGet" '),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              ' ТЕСТ ПО  МУЛЬТФИЛЬМАМ ',
              style: TextStyle(color: Colors.amber, fontSize: 20),
            ),
            _questionWidget(),
            _answerList(),
            _nextButton(),
          ],
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            'Question ${currentQuestionIndex + 1}/ ${questionList.length.toString()}',
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 3, 32, 55),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answerList
          .map((e) => _answerButton(e),)
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(
          answer.answerText,
          style: const TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.amber : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  _nextButton() {
    bool isLastquestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastquestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastquestion ? 'Отправить' : 'Cледующий'),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: const Color.fromARGB(255, 43, 85, 158),
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if (isLastquestion) {
            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;

    if (score >= questionList.length * 0.6) {
      isPassed = true;
    }

    String title = isPassed ? 'Cдали!' : 'He сдали';

    return AlertDialog(
      title: Text(
        title + '\n Правильных ответов $score',
        style: TextStyle(color: isPassed ? Colors.green : Colors.red),
      ),
      content: ElevatedButton(
        child: const Text('повтори́ть'),
        onPressed: () {
          Navigator.pop(context);

          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  } 
}
                            