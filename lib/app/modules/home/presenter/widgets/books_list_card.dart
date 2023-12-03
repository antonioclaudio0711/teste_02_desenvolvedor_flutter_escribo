import 'package:flutter/material.dart';

class BooksListCard extends StatelessWidget {
  const BooksListCard({
    super.key,
    required this.cardFunction,
    required this.favoriteFunction,
    required this.cardImage,
    required this.bookTitle,
    required this.bookAuthor,
    required this.markerColor,
  });

  final VoidCallback cardFunction;
  final VoidCallback favoriteFunction;
  final String cardImage;
  final String bookTitle;
  final String bookAuthor;
  final Color? markerColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardFunction,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 95,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Image.network(cardImage),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  bookTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
                const SizedBox(height: 5),
                Text(
                  bookAuthor,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 10),
                ),
              ],
            ),
          ),
          Positioned(
            left: 106,
            top: -15,
            child: IconButton(
              onPressed: favoriteFunction,
              icon: Icon(
                Icons.bookmark_sharp,
                size: 40,
                color: markerColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
