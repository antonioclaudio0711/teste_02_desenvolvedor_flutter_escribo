import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/pages/home_page.dart';
import 'package:teste_tecnico_02_ereader/utils/app_routes.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      AppRoutes.initialRoute,
      child: (context) => const HomePage(),
    );
  }
}
