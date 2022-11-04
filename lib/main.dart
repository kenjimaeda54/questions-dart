import 'package:flutter/material.dart';
import "./quiz.dart";
import "./results.dart";

main(){
  runApp(const QuestionApp());
}

class QuestionState extends State<QuestionApp>  {
  //VARS
  late var _questionsIndexSelected = 0;
  late String  _questionSelected = "What your color favorite?";
  late List<Map<String,Object>> answers =   [
    {"text":"Black", "point": 10 },
    {"text": "Red", "point": 7},
    {"text":"Green", "point": 3},
    {"text":"White","point": 1},
  ];
  late int  _punctuation = 0;

  var questions = [
    {
      "text": "What your color favorite?",
      "answer": [
        {"text":"Black", "point": 10 },
        {"text": "Red", "point": 7},
        {"text":"Green", "point": 3},
        {"text":"White","point": 1},
      ],
    },
    {
      "text": "What your animal favorite?",
      "answer": [
        {"text": "Rabbit","point":10},
        {"text":"Snak","point":7},
        {"text":"Elephant","point":3},
        {"text":"Lyon","point":1}
      ],
    },
    {
      "text": "What your instructor favorite?",
      "answer": [
        {"text": "Maria","point":10},
        {"text":"João","point": 7 },
        {"text":"Leo","point":3},
        {"text":"Pedro","point":  1}
      ],
    },
  ];

  void handleRest() {
    setState(() {
      _questionsIndexSelected = 0;
      _punctuation = 0;
      answers =  [
        {"text":"Black", "point": 10 },
        {"text": "Red", "point": 7},
        {"text":"Green", "point": 3},
        {"text":"White","point": 1},
      ];
      _questionSelected = "What your color favorite?";
    });
  }

  void handleAnswer(int punctuation) {
    setState(() {
        _questionsIndexSelected += 1;
        _punctuation += punctuation;
        if (_questionsIndexSelected < questions.length) {
          //para alterar a view precisa colocar dentro do setState
          final  answerCurrent = questions[_questionsIndexSelected]["answer"] as List<Map<String,Object>>;
          //para realizar o cast em outras linguages e com o  as
          //aqui precisa realmente aplicar o cast()
          answers =  answerCurrent.map((it) => it).toList().cast();
          _questionSelected = questions[_questionsIndexSelected]["text"] as String;
        }
    });

  }


  @override
  Widget build(BuildContext context) {


    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Questions"),
        ),
        body: _questionsIndexSelected < questions.length  ?
           Quiz(answer: answers, question: _questionSelected, handleAnswer: handleAnswer)
            :  Results(punctuation: _punctuation, handleRest: handleRest)
      ),
    );
  }
}

//existe uma diferenca importante entre StateFullWidget x StatelessWidget
//StateFullWidget   permitir manipular internamente estados ou seja e mutavel

//StatelessWidget e imutavel nao tem estado interno, se deseja renderiza algo internamente apos um  evento
//precisa ser dados externos

//tudo que renderiza na arvore precisa estar no state
class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  State<StatefulWidget> createState() {
     return QuestionState();
  }

}