import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';

class BookMapper {
  Map<String, dynamic> booksToJson(Book entity) => {
        "id": entity.id,
        "title": entity.title,
        "author": entity.author,
        "cover_url": entity.coverUrl,
        "download_url": entity.downloadUrl,
      };

  Book booksFromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        coverUrl: json["cover_url"],
        downloadUrl: json["download_url"],
      );
}
