import 'package:portifolio/src/models/github_project_model.dart';
import 'package:portifolio/src/repository/language_icons_repository.dart';
import 'package:portifolio/utils/repository_factory.dart';

class LangIconsUsecase {
  late LangIconsRepository _langIconsRepository;

  LangIconsUsecase(RepositoryFactory _factory) {
    _langIconsRepository = _factory.langIconsRepository;
  }

  Future<List<String>> execute(List<Project> projects) async {
    try {
      List<String> languageUrls = [];
      for (String languageName
          in projects.map((e) => e.language.toLowerCase()).toList()) {
        String? url = await _langIconsRepository.getIcon(languageName);
        if (url != null && !languageUrls.contains(url)) {
          languageUrls.add(url);
        }
      }
      return languageUrls;
    } on Exception {
      return [];
    }
  }
}
