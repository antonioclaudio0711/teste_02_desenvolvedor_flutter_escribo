import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/store/home_store.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/widgets/book_list.dart';
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
  late Future<void> inicialization;
  late bool isSelectedAllBooksList;
  late bool isSelectedFavoriteBooksList;

  @override
  void initState() {
    inicialization = inicializationApp();
    isSelectedAllBooksList = true;
    isSelectedFavoriteBooksList = false;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> inicializationApp() async {
    await store.fetchBooks();
    await store.loadFavoriteBooksList();
    store.classifyFavoriteBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkPurple,
        centerTitle: true,
        title: const Text('E-Reader Escribo'),
      ),
      body: FutureBuilder(
        future: inicialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
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
                  const SizedBox(height: 15),
                  isSelectedAllBooksList
                      ? BlocBuilder<HomeStore, HomeState>(
                          bloc: store,
                          builder: (context, state) {
                            return BookList(
                              store: store,
                              bookList: state.booksList,
                            );
                          },
                        )
                      : BlocBuilder<HomeStore, HomeState>(
                          bloc: store,
                          builder: (context, state) {
                            return BookList(
                              store: store,
                              bookList: state.favoriteBooksList,
                            );
                          },
                        ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
