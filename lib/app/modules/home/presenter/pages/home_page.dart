import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/store/home_store.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/widgets/list_books_card.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/widgets/top_books_card.dart';
import 'package:teste_tecnico_02_ereader/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.store});

  final HomeStore store;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore get store => widget.store;
  late bool isSelectedAllBooksList;
  late bool isSelectedFavoriteBooksList;

  @override
  void initState() {
    store.fetchBooks();
    isSelectedAllBooksList = true;
    isSelectedFavoriteBooksList = false;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkPurple,
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
                TopBooksCard(
                    textCard: 'Todos os livros',
                    isSelectedCard: isSelectedAllBooksList,
                    cardFunction: () {
                      setState(() {
                        isSelectedAllBooksList = !isSelectedAllBooksList;
                        if (isSelectedAllBooksList) {
                          isSelectedFavoriteBooksList = false;
                        } else {
                          isSelectedFavoriteBooksList = true;
                        }
                      });
                    }),
                TopBooksCard(
                  textCard: 'Favoritos',
                  isSelectedCard: isSelectedFavoriteBooksList,
                  cardFunction: () {
                    setState(() {
                      isSelectedFavoriteBooksList =
                          !isSelectedFavoriteBooksList;
                      if (isSelectedFavoriteBooksList) {
                        isSelectedAllBooksList = false;
                      } else {
                        isSelectedAllBooksList = true;
                      }
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 25),
            isSelectedAllBooksList
                ? Expanded(
                    child: BlocBuilder<HomeStore, HomeState>(
                      bloc: store,
                      builder: (context, state) {
                        return GridView.builder(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (screenWidth / 150).floor() > 0
                                ? (screenWidth / 150).floor()
                                : 1,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 30,
                          ),
                          itemCount: state.listBooks.length,
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
                        );
                      },
                    ),
                  )
                : Text('Lista de livros favoritos'),
          ],
        ),
      ),
    );
  }
}
