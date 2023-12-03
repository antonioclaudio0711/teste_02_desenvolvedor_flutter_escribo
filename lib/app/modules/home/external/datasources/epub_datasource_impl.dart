import 'package:teste_tecnico_02_ereader/app/modules/home/infra/datasources/epub_datasource.dart';
import 'package:url_launcher/url_launcher.dart';

class EpubDatasourceImpl implements EpubDatasource {
  const EpubDatasourceImpl();

  @override
  Future<void> fetchEpub({required String bookUrl}) async {
    final Uri url = Uri.parse(bookUrl);

    try {
      await launchUrl(url);
    } catch (e) {
      throw Exception('Falha ao realizar o download do Epub!');
    }
  }
}
