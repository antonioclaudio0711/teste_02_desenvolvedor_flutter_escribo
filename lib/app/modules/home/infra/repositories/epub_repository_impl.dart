import 'package:result_dart/result_dart.dart';
import 'package:teste_tecnico_02_ereader/app/core/ereader_failure.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/repositories/epub_repository.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/infra/datasources/epub_datasource.dart';

class EpubRepositoryImpl implements EpubRepository {
  const EpubRepositoryImpl({required this.datasource});

  final EpubDatasource datasource;

  @override
  Future fetchEpub({required String bookUrl}) async {
    try {
      await datasource.fetchEpub(bookUrl: bookUrl);
    } on EReaderFailure catch (error) {
      return Failure(error);
    }
  }
}
