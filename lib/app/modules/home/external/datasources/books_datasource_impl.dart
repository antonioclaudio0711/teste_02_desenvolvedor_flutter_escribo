import 'dart:convert';

import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/external/mappers/book_mapper.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/infra/datasources/books_datasource.dart';
import 'package:http/http.dart' as http;

class BooksDatasourceImpl implements BooksDatasource {
  const BooksDatasourceImpl();

  @override
  Future<List<Book>> fetchBooks() async {
    final Uri url = Uri.https('escribo.com', '/books.json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((book) => BookMapper().booksFromJson(book))
            .toList();
      } else {
        throw Exception('Falha ao carregar os livros!');
      }
    } catch (e) {
      throw Exception('Falha ao carregar os livros!');
    }
  }
}
