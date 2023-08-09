import 'dart:convert';

// Github project model
class Project {
  final String name;
  final String? description;
  final String language;
  final String url;

  Project({
    required this.name,
    required this.description,
    required this.language,
    required this.url,
  });

  static List<Project> fromList(List jsonList) {
    final List<Project> projects = [];
    for (final json in jsonList) {
      try {
        projects.add(Project.fromMap(json));
      } catch (e) {
        continue;
      }
    }
    return projects;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'language': language,
      'url': url,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    try {
      return Project(
        name: map['name'] as String,
        description: map['description'] as String?,
        language: map['language'] as String,
        url: map['url'] as String,
      );
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  String toJson() => json.encode(toMap());
}
