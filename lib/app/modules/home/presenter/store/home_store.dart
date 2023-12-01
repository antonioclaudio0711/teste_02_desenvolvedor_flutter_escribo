import 'package:equatable/equatable.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';
import 'package:bloc/bloc.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/usecases/fetch_books_usecase/fetch_books_usecase.dart';

part 'home_state.dart';

class HomeStore extends Cubit<HomeState> {
  HomeStore(this._fetchBooksUsecase) : super(const HomeState());

  final FetchBooksUsecase _fetchBooksUsecase;

  void fetchBooks() async {
    emit(state.copyWith(state: const LoadingHomeState()));

    final response = await _fetchBooksUsecase();

    response.fold(
      (success) => emit(
        state.copyWith(
          state: const SuccessHomeState(),
          listBooks: success,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          state: const FailureHomeState(),
        ),
      ),
    );
  }
}
