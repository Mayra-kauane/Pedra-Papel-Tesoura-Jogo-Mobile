import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final String message;

  const ResultDisplay({required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Resultado',
            style: TextStyle(
                color: Color.fromARGB(255, 41, 17, 73),
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        Text(message,
            style: TextStyle(
                color: Color.fromARGB(255, 41, 17, 73),
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
