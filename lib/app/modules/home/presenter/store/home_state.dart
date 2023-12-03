part of 'home_store.dart';

abstract class HomeStateEReaderEscribo extends Equatable {
  const HomeStateEReaderEscribo();
}

class InitialHomeState extends HomeStateEReaderEscribo {
  const InitialHomeState();

  @override
  List<Object?> get props => [];
}

class LoadingHomeState extends HomeStateEReaderEscribo {
  const LoadingHomeState();

  @override
  List<Object?> get props => [];
}

class SuccessHomeState extends HomeStateEReaderEscribo {
  const SuccessHomeState();

  @override
  List<Object?> get props => [];
}

class FailureHomeState extends HomeStateEReaderEscribo {
  const FailureHomeState();

  @override
  List<Object?> get props => [];
}

class HomeState extends Equatable {
  final HomeStateEReaderEscribo state;
  final List<Book> booksList;
  final List<Book> favoriteBooksList;
  final List<int> favoriteBooksIdList;

  const HomeState({
    this.state = const InitialHomeState(),
    this.booksList = const [],
    this.favoriteBooksList = const [],
    this.favoriteBooksIdList = const [],
  });

  HomeState copyWith({
    HomeStateEReaderEscribo? state,
    List<Book>? booksList,
    List<Book>? favoriteBooksList,
    List<int>? favoriteBooksIdList,
  }) {
    return HomeState(
      state: state ?? this.state,
      booksList: booksList ?? this.booksList,
      favoriteBooksList: favoriteBooksList ?? this.favoriteBooksList,
      favoriteBooksIdList: favoriteBooksIdList ?? this.favoriteBooksIdList,
    );
  }

  @override
  List<Object?> get props => [
        state,
        booksList,
        favoriteBooksList,
        favoriteBooksIdList,
      ];
}
