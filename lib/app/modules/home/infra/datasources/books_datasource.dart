import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';

abstract class BooksDatasource {
  Future<List<Book>> fetchBooks();
}
