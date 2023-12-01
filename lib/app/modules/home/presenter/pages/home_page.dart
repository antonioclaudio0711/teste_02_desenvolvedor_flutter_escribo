import 'package:flutter/material.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/widgets/list_books_card.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/widgets/top_books_card.dart';
import 'package:teste_tecnico_02_ereader/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackgroundColor,
        centerTitle: true,
        title: const Text('E-Reader Escribo'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TopBooksCard(textCard: 'Todos os livros', cardFunction: () {}),
                TopBooksCard(textCard: 'Favoritos', cardFunction: () {}),
              ],
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (screenWidth / 150).floor() > 0
                      ? (screenWidth / 150).floor()
                      : 1,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return ListBooksCard(
                    cardFunction: () {},
                    favoriteFunction: () {},
                    cardImage:
                        'https://www.gutenberg.org/cache/epub/19218/pg19218.cover.medium.jpg',
                    bookTitle:
                        'The History of England in Three Volumes, Vol.III.',
                    bookAuthor: 'Edward Farr and E. H. Nolan',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
