import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/store/home_store.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/widgets/books_list_card.dart';

class BookList extends StatefulWidget {
  const BookList({
    super.key,
    required this.store,
    required this.bookList,
  });

  final HomeStore store;
  final List<Book> bookList;

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  HomeStore get store => widget.store;
  List<Book> get bookList => widget.bookList;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: BlocBuilder<HomeStore, HomeState>(
        bloc: store,
        builder: (context, state) {
          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (screenWidth / 150).floor() > 0
                  ? (screenWidth / 150).floor()
                  : 1,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount: bookList.length,
            itemBuilder: (context, index) {
              return BooksListCard(
                cardFunction: () {},
                markerColor:
                    state.favoriteBooksIdList.contains(bookList[index].id)
                        ? Colors.red
                        : null,
                favoriteFunction: () async {
                  await store.editFavoriteList(
                    book: bookList[index],
                  );

                  store.classifyFavoriteBooks();
                },
                cardImage: bookList[index].coverUrl,
                bookTitle: utf8.decode(
                  bookList[index].title.runes.toList(),
                ),
                bookAuthor: bookList[index].author,
              );
            },
          );
        },
      ),
    );
  }
}
