import "package:flutter/material.dart";


class Results extends StatelessWidget {

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

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child:  Text(
            phraseResult,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: handleRest,
            child: const  Text("Reset?",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue
              ),
            )
        )
      ],
    );
  }
}
