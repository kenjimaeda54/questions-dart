import "package:flutter/material.dart";
import "./anwser.dart";
import "./question.dart";

class Quiz extends StatelessWidget {
  final List<Map<String,Object>> answer;
  final String question;
  final void Function(int) handleAnswer;

  const Quiz({
    super.key,
    required this.answer,
    required this.question,
    required this.handleAnswer,
  });


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
}

