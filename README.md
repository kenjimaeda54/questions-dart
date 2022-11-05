# Questions
Aplicativo de perguntas e respostas

## Motivação
Entender como Flutter funciona, suas principais diferenças entre outras tecnologias hibridas presentes

## Feature
- Para realizar atualização na árvore de componentes e variáveis internamente, precisamos estender StatefulWidget
- A sua construção e bem similar ao StatelessWidget, diferença que precisamos de uma classe que vai estender de State
- Abaixo um exemplo
- StatelessWidget e uma classe que normalmente geramos herança apenas quando desejamos métodos e propriedades imutáveis, ou seja, internamente não é possível alterar seus métodos
- Única forma de alterar algo e via construtor, ou seja, dados externos



```dart
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

/


class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  State<StatefulWidget> createState() {
     return QuestionState();
  }

}

```
##

- Qualquer atualização de variáveis, métodos precisam estar dentro da propriedade setState
- Por exemplo, desejo mudar um texto na árvore de componente, esta logica do texto precisa estar no setState

```dart
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


```
##

- Quando deseja realizar condições de renderização dinâmica e ideal usar um get 
- Aqui também é possível aproveitar recurso do paradigma funcional e usar map para inteirar e reduzir código
- Única diferença abaixo e que precisamos espalhar nossos Widget com spread operador, porque children e um array,se nao ficaria array com array

```dart
  final int punctuation;
  final void Function() handleRest;

  const Results({super.key, required this.punctuation,required this.handleRest});

  String get phraseResult {
    if(punctuation  < 8) {
      return "Congratulations";
    }
    if (punctuation < 12) {
      return "You is good";
    }
    if (punctuation < 16) {
      return "Impressive";
    }
    return "Level Jedi";
  }
  
  //===================
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question),
        //identico e feito em aplicacoes React native e React js
        //diferenca que precisamos espalhar os valores com spreed operator
        ...answer.map((it) =>
            Answer("${it["text"]}",()=> handleAnswer(it["point"] as int)),
        )
      ],
    );
  }

```





