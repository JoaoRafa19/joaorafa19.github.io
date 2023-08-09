// Repository to get the github projects from the user

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portifolio/src/models/github_project_model.dart';

class GithubProjectsRepository extends GetConnect {
  Future<List<Project>> getProjects() async {
    try {
      final response =
          await get('https://api.github.com/users/JoaoRafa19/repos');
      if (response.hasError) {
        throw Exception('Erro ao buscar os projetos');
      } else {
        if (response.statusCode == 200) {
          final repos = Project.fromList(response.body);
          return repos;
        } else {
          throw Exception('Erro ao buscar os projetos');
        }
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw Exception('Erro ao buscar os projetos');
    }
  }
}
