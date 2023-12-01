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
  final List<Book> listBooks;

  const HomeState({
    this.state = const InitialHomeState(),
    this.listBooks = const [],
  });

  HomeState copyWith({
    HomeStateEReaderEscribo? state,
    List<Book>? listBooks,
  }) {
    return HomeState(
      state: state ?? this.state,
      listBooks: listBooks ?? this.listBooks,
    );
  }

  @override
  List<Object?> get props => [
        state,
        listBooks,
      ];
}
