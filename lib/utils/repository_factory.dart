import 'package:portifolio/src/repository/github_project_repository.dart';

abstract class RepositoryFactory {
  GithubProjectsRepository get githubProjectsRepository;
  
}