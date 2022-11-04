import "package:flutter/material.dart";


class Results extends StatelessWidget {

  final String results;

  const Results(this.results,{Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        results,
       style: const TextStyle(fontSize: 28),
        ),
    );
  }
}
