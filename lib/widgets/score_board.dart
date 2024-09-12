import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  final int playerScore;
  final int computerScore;

  const ScoreBoard({
    required this.playerScore,
    required this.computerScore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
            Text('Placar',
            style: TextStyle(
            color: const Color.fromARGB(255, 41, 17, 73),
            fontSize: 15,
            fontWeight: FontWeight.bold)),
    Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 76, 39, 117),
        borderRadius: BorderRadius.circular(30),
      ),
      width: 300,
      height: 100,
      margin: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Você',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              Text(
                playerScore.toString(),
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('PC', style: TextStyle(color: Colors.white, fontSize: 15)),
              Text(
                computerScore.toString(),
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ],
          ),
        ],
      ),
    )
  ]
  );
  }
}
