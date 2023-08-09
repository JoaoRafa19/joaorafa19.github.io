import 'package:portifolio/src/repository/github_project_repository.dart';
import 'package:portifolio/utils/repository_factory.dart';

class RepositoryFactoryImpl implements RepositoryFactory {
  @override
  GithubProjectsRepository get githubProjectsRepository =>
      GithubProjectsRepository();
}
