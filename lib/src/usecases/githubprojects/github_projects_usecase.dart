// Usecase to get the github projects from the user

import 'package:portifolio/src/models/github_project_model.dart';
import 'package:portifolio/src/repository/github_project_repository.dart';
import 'package:portifolio/utils/repository_factory.dart';

class GithubProjectsUsecase {
  late GithubProjectsRepository _repository;

  GithubProjectsUsecase(RepositoryFactory repositoryFactory) {
    _repository = repositoryFactory.githubProjectsRepository;
  }

  Future<List<Project>> execute() async {
    try {
      final projects = await _repository.getProjects();
      return projects;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
