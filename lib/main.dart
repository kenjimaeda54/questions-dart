import 'package:flutter/material.dart';
import "./question.dart";
import "./anwser.dart";

main(){
  runApp(const QuestionApp());
}

class QuestionState extends State<QuestionApp>  {
  //VARS
  late var _questionsSelected = 0;
  late List<String> answers =  questions[_questionsSelected]["answer"] as List<String>;

  var questions = [
    {
      "text": "What your color favorite?",
      "answer": ["Black", "Red", "Green", "White" ],
    },
    {
      "text": "What your animal favorite?",
      "answer": ["Rabbit", "Snak", "Elephant", "Lyon" ],
    },
    {
      "text": "What your instructor favorite?",
      "answer": ["Maria", "João", "Leo", "Pedro" ],
    },
  ];

  void handleAnswer() {
    setState(() {
        _questionsSelected += 1;
        if (_questionsSelected < questions.length) {
          //para alterar a view precisa colocar dentro do setState
          answers = questions[_questionsSelected]["answer"] as List<String>;
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
        body: _questionsSelected < questions.length  ?  Column(
          children: [
            Question(questions[_questionsSelected]["text"] as String),
            //identico e feito em aplicacoes React native e React js
            //diferenca que precisamos espalhar os valores com spreed operator
            ...answers.map((it) =>
                Answer(it, handleAnswer),
            )
          ],
        ) : const Center(
             child:  Text(
                  "Congrullations",
                  style: TextStyle(fontSize: 28),
             ),
        ),
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