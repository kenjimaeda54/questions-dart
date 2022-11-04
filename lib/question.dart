  import 'package:flutter/material.dart';

  class Question extends StatelessWidget {

   final String text;

   const Question(this.text, {super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
          width: double.infinity, //pegar a largura maxima
          margin: const EdgeInsets.all(10),
          child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                          fontSize: 25
                    ),
          )
      );
    }
  }
