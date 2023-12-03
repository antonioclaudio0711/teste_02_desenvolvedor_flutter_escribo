import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/repositories/books_repository.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/repositories/epub_repository.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/usecases/fetch_books_usecase/fetch_books_usecase.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/usecases/fetch_books_usecase/fetch_books_usecase_impl.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/usecases/fetch_epub_usecase/fetch_epub_usecase.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/usecases/fetch_epub_usecase/fetch_epub_usecase_impl.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/external/datasources/books_datasource_impl.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/external/datasources/epub_datasource_impl.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/infra/datasources/books_datasource.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/infra/datasources/epub_datasource.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/infra/repositories/books_repository_impl.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/infra/repositories/epub_repository_impl.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/pages/home_page.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/store/home_store.dart';
import 'package:teste_tecnico_02_ereader/utils/app_routes.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add<BooksRepository>(BooksRepositoryImpl.new);
    i.add<BooksDatasource>(BooksDatasourceImpl.new);
    i.add<FetchBooksUsecase>(FetchBooksUsecaseImpl.new);
    i.add<EpubRepository>(EpubRepositoryImpl.new);
    i.add<EpubDatasource>(EpubDatasourceImpl.new);
    i.add<FetchEpubUsecase>(FetchEpubUsecaseImpl.new);
    i.add(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child(
      AppRoutes.initialRoute,
      child: (context) => HomePage(store: context.read<HomeStore>()),
    );
  }
}
