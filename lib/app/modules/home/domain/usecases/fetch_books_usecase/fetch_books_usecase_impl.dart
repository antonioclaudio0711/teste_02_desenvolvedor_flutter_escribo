import 'package:result_dart/result_dart.dart';
import 'package:teste_tecnico_02_ereader/app/core/ereader_failure.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/repositories/books_repository.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/usecases/fetch_books_usecase/fetch_books_usecase.dart';

class FetchBooksUsecaseImpl implements FetchBooksUsecase {
  const FetchBooksUsecaseImpl({required this.repository});

  final BooksRepository repository;

  @override
  Future<Result<List<Book>, EReaderFailure>> call() async {
    final response = await repository.fetchBook();
    return response;
  }
}
