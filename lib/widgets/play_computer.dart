import 'package:flutter/material.dart';

class PlayComputer extends StatelessWidget {
  final String computerMove;

  const PlayComputer({required this.computerMove});

  @override
  Widget build(BuildContext context) {
    String imageUrl;
    if (computerMove == 'pedra') {
      imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlfNBE5pRNoem1CN1KxBZjoo53EP3-F_gN76TCskOuTrCEQc_ncDX52WYYkheObbHxd-o&usqp=CAU';
    } else if (computerMove == 'papel') {
      imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuCUaSsQOPWsRiB7TK7df9jHK-TVkXlU8zRw-HFTXsiEubhLdlgyMbo--wEnh1pRmUYBo&usqp=CAU';
    } else {
      imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7AlbeTISdjTDYfRPUvJWJlJcP6UnicPqMox_fJrNdrt-Tmj8qpUp_eQxC8yn2GvawS6M&usqp=CAU';
    }

    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.white,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
