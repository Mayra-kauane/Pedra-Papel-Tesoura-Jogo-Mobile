import 'package:flutter/material.dart';

class MoveButton extends StatelessWidget {
  final String move;
  final String imageUrl;
  final VoidCallback onTap;

  const MoveButton({
    required this.move,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
