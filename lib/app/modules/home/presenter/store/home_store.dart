import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';
import 'package:bloc/bloc.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/usecases/fetch_books_usecase/fetch_books_usecase.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/usecases/fetch_epub_usecase/fetch_epub_usecase.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/external/mappers/book_mapper.dart';

part 'home_state.dart';

class HomeStore extends Cubit<HomeState> {
  HomeStore(this._fetchBooksUsecase, this._fetchEpubUsecase)
      : super(const HomeState());

  final FetchBooksUsecase _fetchBooksUsecase;
  final FetchEpubUsecase _fetchEpubUsecase;

  Future<void> fetchBooks() async {
    emit(state.copyWith(state: const LoadingHomeState()));

    final response = await _fetchBooksUsecase();

    response.fold(
      (success) => emit(state.copyWith(
        state: const SuccessHomeState(),
        booksList: success,
      )),
      (failure) => emit(state.copyWith(
        state: const FailureHomeState(),
      )),
    );
  }

  Future<void> loadFavoriteBooksList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    List<String> stringFavoriteBooksList =
        preferences.getStringList('favoriteBook') ?? [];

    List<Book> objectFavoriteBooksList = stringFavoriteBooksList
        .map((jsonBook) => BookMapper().booksFromJson(jsonDecode(jsonBook)))
        .toList();

    emit(state.copyWith(
      state: const SuccessHomeState(),
      favoriteBooksList: objectFavoriteBooksList,
    ));
  }

  void classifyFavoriteBooks() {
    List<int> favoriteBookIdList =
        state.favoriteBooksList.map((book) => book.id).toList();

    emit(state.copyWith(
      state: const SuccessHomeState(),
      favoriteBooksIdList: favoriteBookIdList,
    ));
  }

  Future<void> editFavoriteList({required Book book}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool alreadyIsFavorite = false;

    List<String> stringFavoriteBooksList =
        preferences.getStringList('favoriteBook') ?? [];

    List<Book> comparativeFavoriteBookList = stringFavoriteBooksList
        .map((jsonBook) => BookMapper().booksFromJson(jsonDecode(jsonBook)))
        .toList();

    for (var elementBooksList in comparativeFavoriteBookList) {
      if (book.id == elementBooksList.id) {
        alreadyIsFavorite = true;
      }
    }

    !alreadyIsFavorite
        ? stringFavoriteBooksList
            .add(jsonEncode(BookMapper().booksToJson(book)))
        : stringFavoriteBooksList
            .remove(jsonEncode(BookMapper().booksToJson(book)));

    await preferences.setStringList(
      'favoriteBook',
      stringFavoriteBooksList,
    );

    List<Book> objectFavoriteBooksList = stringFavoriteBooksList
        .map((jsonBook) => BookMapper().booksFromJson(jsonDecode(jsonBook)))
        .toList();

    emit(state.copyWith(
      state: const SuccessHomeState(),
      favoriteBooksList: objectFavoriteBooksList,
    ));
  }

  Future<void> downloadAndSaveEpub({required String url}) async {
    emit(state.copyWith(state: const LoadingHomeState()));

    await _fetchEpubUsecase(bookUrl: url);
  }
}
