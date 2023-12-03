import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/store/home_store.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/widgets/books_list_card.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/widgets/custom_dialog.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';
import 'package:http/http.dart' as http;

class BookList extends StatefulWidget {
  const BookList({
    super.key,
    required this.store,
    required this.bookList,
  });

  final HomeStore store;
  final List<Book> bookList;

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  HomeStore get store => widget.store;
  List<Book> get bookList => widget.bookList;
  bool isFavorite = false;
  String filePath = '';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: BlocBuilder<HomeStore, HomeState>(
        bloc: store,
        builder: (context, state) {
          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (screenWidth / 150).floor() > 0
                  ? (screenWidth / 150).floor()
                  : 1,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount: bookList.length,
            itemBuilder: (context, index) {
              return BooksListCard(
                cardFunction: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                            book: bookList[index],
                            onClickOpenEbook: () async {
                              print("=====filePath======$filePath");
                              if (filePath == "") {
                                final response = await http.get(
                                    Uri.parse(bookList[index].downloadUrl));
                                final directory =
                                    await getApplicationDocumentsDirectory();
                                File file = File(
                                    '${directory.path}/livro${bookList[index].id}.epub');
                                await file.writeAsBytes(response.bodyBytes);
                                print('Arquivo salvo em: ${file.path}');

                                // final httpClientRequest = await response.close();
                                // final appDocDir =
                                //     await DownloadsPathProvider.downloadsDirectory;
                                // final file =
                                //     File('${appDocDir.path}/arquivo.epub');
                                // final fileSink = file.openWrite();

                                // await httpClientRequest.pipe(fileSink);

                                // await fileSink.close();

                                setState(() {
                                  filePath = file.path;
                                });

                                print(filePath);
                              } else {
                                VocsyEpub.setConfig(
                                  themeColor: Theme.of(context).primaryColor,
                                  identifier: "iosBook",
                                  scrollDirection:
                                      EpubScrollDirection.ALLDIRECTIONS,
                                  allowSharing: true,
                                  enableTts: true,
                                  nightMode: true,
                                );

                                // get current locator
                                VocsyEpub.locatorStream.listen((locator) {
                                  print('LOCATOR: $locator');
                                });

                                VocsyEpub.open(
                                  filePath,
                                  lastLocation: EpubLocator.fromJson({
                                    "bookId": "2239",
                                    "href": "/OEBPS/ch06.xhtml",
                                    "created": 1539934158390,
                                    "locations": {
                                      "cfi":
                                          "epubcfi(/0!/4/4[simple_book]/2/2/6)"
                                    }
                                  }),
                                );
                              }
                            },
                            onClickDownload: () async {
                              final response = await http
                                  .get(Uri.parse(bookList[index].downloadUrl));
                              final directory = await getDownloadsDirectory();

                              File file = File(
                                  '${directory!.path}/livro${bookList[index].id}.epub');
                              await file.writeAsBytes(response.bodyBytes);
                              print('Arquivo salvo em: ${file.path}');

                              // final httpClientRequest = await response.close();
                              // final appDocDir =
                              //     await DownloadsPathProvider.downloadsDirectory;
                              // final file =
                              //     File('${appDocDir.path}/arquivo.epub');
                              // final fileSink = file.openWrite();

                              // await httpClientRequest.pipe(fileSink);

                              // await fileSink.close();

                              setState(() {
                                filePath = file.path;
                              });

                              print(filePath);
                            });
                      });
                },
                markerColor:
                    state.favoriteBooksIdList.contains(bookList[index].id)
                        ? Colors.red
                        : null,
                favoriteFunction: () async {
                  await store.editFavoriteList(
                    book: bookList[index],
                  );

                  store.classifyFavoriteBooks();
                },
                cardImage: bookList[index].coverUrl,
                bookTitle: utf8.decode(
                  bookList[index].title.runes.toList(),
                ),
                bookAuthor: bookList[index].author,
              );
            },
          );
        },
      ),
    );
  }
}
