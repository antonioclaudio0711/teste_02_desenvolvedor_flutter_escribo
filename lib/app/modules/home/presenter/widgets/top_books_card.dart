import 'package:flutter/material.dart';
import 'package:teste_tecnico_02_ereader/utils/app_colors.dart';

class TopBooksCard extends StatelessWidget {
  const TopBooksCard({
    super.key,
    required this.textCard,
    required this.cardFunction,
    required this.isSelectedCard,
  });

  final String textCard;
  final VoidCallback cardFunction;
  final bool isSelectedCard;

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
          color: isSelectedCard ? AppColors.lightGray : Colors.transparent,
          border: Border.all(color: Colors.white),
        ),
        child: Center(child: Text(textCard)),
      ),
    );
  }
}
