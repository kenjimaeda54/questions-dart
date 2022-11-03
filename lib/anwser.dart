import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  //de preferencia em usar o tipo
  //pois se nao colocar ir infereir do tipo
  //dynamic
  String answer;
  void Function()  handleAnswer;

  Answer(this.answer,this.handleAnswer, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              width: double.infinity,
              child:
                ElevatedButton(
                     onPressed: handleAnswer,
                     child: Text(answer)
                ));
    }
}
