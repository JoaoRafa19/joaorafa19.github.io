import 'package:portifolio/src/repository/github_project_repository.dart';
import 'package:portifolio/src/repository/language_icons_repository.dart';

abstract class RepositoryFactory {
  GithubProjectsRepository get githubProjectsRepository;
  LangIconsRepository get langIconsRepository;
}