import 'package:result_dart/result_dart.dart';
import 'package:teste_tecnico_02_ereader/app/core/ereader_failure.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';

abstract class FetchBooksUsecase {
  Future<Result<List<Book>, EReaderFailure>> call();
}
