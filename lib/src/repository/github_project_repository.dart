// Repository to get the github projects from the user

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portifolio/src/models/github_project_model.dart';

class GithubProjectsRepository extends GetConnect {
  static const String _baseUrl =
      "https://api.github.com/users/JoaoRafa19/repos";
  Future<List<Project>> getProjects() async {
    try {
      final response = await get(_baseUrl);
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

  Future<List<Project>> lastProjects() async {
    try {
      final projects = await get(_baseUrl, query: {"sort": "updated"});
      if (projects.hasError) {
        throw Exception('Erro ao buscar os projetos');
      } else {
        if (projects.statusCode == 200) {
          final repos = Project.fromList(projects.body);
          return repos;
        } else {
          throw Exception('Erro ao buscar os projetos');
        }
      }
    } on Exception {
      return [];
    }
  }
}
