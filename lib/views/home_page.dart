import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_application_1/widgets/buttons.dart';
import 'package:flutter_application_1/widgets/play_computer.dart';
import 'package:flutter_application_1/widgets/result_display.dart';
import 'package:flutter_application_1/widgets/score_board.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int playerScore = 0;
  int computerScore = 0;
  String message = "";
  String computerMove = "";
  String playerMove = "";

  void game(String choosePlayer) {
    List<String> options = ['pedra', 'papel', 'tesoura'];
    String chooseComputer = options[Random().nextInt(3)];

    setState(() {
      playerMove = choosePlayer;
      computerMove = chooseComputer;

      if (choosePlayer == chooseComputer) {
        message = "Empatou!";
      } else if ((choosePlayer == 'pedra' && chooseComputer == 'tesoura') ||
          (choosePlayer == 'papel' && chooseComputer == 'pedra') ||
          (choosePlayer == 'tesoura' && chooseComputer == 'papel')) {
        message = "Você ganhou :)";
        playerScore++;
      } else {
        message = "Você perdeu ;(";
        computerScore++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedra, Papel, Tesoura',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 76, 39, 117),
      ),
      body: Container(
        color: const Color.fromARGB(255, 196, 159, 238),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text('Sua jogada',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 41, 17, 73),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MoveButton(
                      move: 'pedra',
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlfNBE5pRNoem1CN1KxBZjoo53EP3-F_gN76TCskOuTrCEQc_ncDX52WYYkheObbHxd-o&usqp=CAU',
                      onTap: () => game('pedra'),
                    ),
                    MoveButton(
                      move: 'papel',
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuCUaSsQOPWsRiB7TK7df9jHK-TVkXlU8zRw-HFTXsiEubhLdlgyMbo--wEnh1pRmUYBo&usqp=CAU',
                      onTap: () => game('papel'),
                    ),
                    MoveButton(
                      move: 'tesoura',
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7AlbeTISdjTDYfRPUvJWJlJcP6UnicPqMox_fJrNdrt-Tmj8qpUp_eQxC8yn2GvawS6M&usqp=CAU',
                      onTap: () => game('tesoura'),
                    ),
                  ],
                ),
              ],
            ),
            PlayComputer(computerMove: computerMove),
            ResultDisplay(message: message),
            ScoreBoard(playerScore: playerScore, computerScore: computerScore),
          ],
        ),
      ),
    );
  }
}
