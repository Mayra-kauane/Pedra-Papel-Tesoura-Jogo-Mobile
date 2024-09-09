import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int playerScore = 0;
  int computerScore = 0;
  String mensage = "Comece sua jogada :)";
  String computerMove = '';
  String playerMove = '';

  void game(String choosePlayer) {
    List<String> opcoes = ['pedra', 'papel', 'tesoura'];

    String chooseComputer = opcoes[Random().nextInt(3)];

    setState(() {
      playerMove = choosePlayer;
      computerMove = chooseComputer;

      if (choosePlayer == chooseComputer) {
        mensage = "Empatou!";
      } else if ((choosePlayer == 'pedra' && chooseComputer == 'tesoura') ||
          (choosePlayer == 'papel' && chooseComputer == 'pedra') ||
          (choosePlayer == 'tesoura' && chooseComputer == 'papel')) {
        mensage = "Você ganhou :)";
        playerScore++;
      } else {
        mensage = "Você perdeu ;(";
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
                    GestureDetector(
                      onTap: () => game('pedra'),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlfNBE5pRNoem1CN1KxBZjoo53EP3-F_gN76TCskOuTrCEQc_ncDX52WYYkheObbHxd-o&usqp=CAU'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => game('papel'),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuCUaSsQOPWsRiB7TK7df9jHK-TVkXlU8zRw-HFTXsiEubhLdlgyMbo--wEnh1pRmUYBo&usqp=CAU'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => game('tesoura'),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7AlbeTISdjTDYfRPUvJWJlJcP6UnicPqMox_fJrNdrt-Tmj8qpUp_eQxC8yn2GvawS6M&usqp=CAU'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Jogada do Computador',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 41, 17, 73),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: computerMove.isNotEmpty
                          ? NetworkImage(
                              computerMove == 'pedra'
                                  ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlfNBE5pRNoem1CN1KxBZjoo53EP3-F_gN76TCskOuTrCEQc_ncDX52WYYkheObbHxd-o&usqp=CAU'
                                  : computerMove == 'papel'
                                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuCUaSsQOPWsRiB7TK7df9jHK-TVkXlU8zRw-HFTXsiEubhLdlgyMbo--wEnh1pRmUYBo&usqp=CAU'
                                      : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7AlbeTISdjTDYfRPUvJWJlJcP6UnicPqMox_fJrNdrt-Tmj8qpUp_eQxC8yn2GvawS6M&usqp=CAU',
                            )
                          : null,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text('Resultado',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 41, 17, 73),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Text(mensage,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 41, 17, 73),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              children: [
                Text('Placar',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 41, 17, 73),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 76, 39, 117),
                      borderRadius: BorderRadius.circular(30)),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          Text(
                            playerScore.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('PC',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          Text(
                            computerScore.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
