import 'package:result_dart/result_dart.dart';
import 'package:teste_tecnico_02_ereader/app/core/ereader_failure.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/repositories/books_repository.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/infra/datasources/books_datasource.dart';

class BooksRepositoryImpl implements BooksRepository {
  const BooksRepositoryImpl({required this.datasource});

  final BooksDatasource datasource;

  @override
  Future<Result<List<Book>, EReaderFailure>> fetchBook() async {
    try {
      final response = await datasource.fetchBooks();
      return Success(response);
    } on EReaderFailure catch (error) {
      return Failure(error);
    }
  }
}
