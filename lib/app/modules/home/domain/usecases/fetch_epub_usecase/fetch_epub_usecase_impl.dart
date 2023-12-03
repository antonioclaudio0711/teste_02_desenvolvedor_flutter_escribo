import 'package:teste_tecnico_02_ereader/app/modules/home/domain/repositories/epub_repository.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/usecases/fetch_epub_usecase/fetch_epub_usecase.dart';

class FetchEpubUsecaseImpl implements FetchEpubUsecase {
  const FetchEpubUsecaseImpl({required this.repository});

  final EpubRepository repository;

  @override
  Future<void> call({required String bookUrl}) async {
    await repository.fetchEpub(bookUrl: bookUrl);
  }
}
