import 'package:flutter/material.dart';

class TopBooksCard extends StatelessWidget {
  const TopBooksCard({
    super.key,
    required this.textCard,
    required this.cardFunction,
  });

  final String textCard;
  final VoidCallback cardFunction;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: cardFunction,
      child: Container(
        height: 40,
        width: screenWidth / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white),
        ),
        child: Center(child: Text(textCard)),
      ),
    );
  }
}
