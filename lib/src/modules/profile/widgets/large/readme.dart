import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark-reasonable.dart';
import 'package:portifolio/src/modules/profile/readme_header_name.dart';
import 'package:portifolio/src/modules/profile/widgets/current_projects.dart';
import 'package:portifolio/src/modules/profile/widgets/large/readme_badge.dart';
import 'package:portifolio/utils/style.dart';

class Readme extends StatelessWidget {
  Readme({
    super.key,
  });

  static const _code = """
class Joao extends Human {
  late final String? nationality;
  late final String? localization;

  @override
  Joao(String name, {String? nationality, String? localization}) : super(name) {
    nationality ??= "Brazilian";
    localization ??= "Belo Horizonte, MG";
  }

  final List<String> languages = [
    "Portuguese",
    "English",
  ];

  final Map<String, dynamic> technologies = {
    "Flutter": ["GetX", "Provider", "MobX", "Bloc"],
    "GoLang": ["GinGonic", "gorm"],
    "Dart": ["Shelf", "Dio"],
    "JavaScript": ["React.js", "Express"],
    "Python": ["Django", "Flask", "Qt", "Pygame"],
  };

  final Map<String, dynamic> databases = {
    "SQL": ["PostgreSQL", "MySQL", "SQLite"],
    "NoSQL": ["MongoDB", "Redis"],
  };

  String getTechologies(String stack) {
    switch (stack) {
      case "Flutter":
        return "GetX, Provider, MobX, Bloc, Firebase, Supabase, Dio";
      case "Frontend":
        return "Flutter, React.js, Tailwind";
      case "Backend":
        return "GoLang, Django, Flask, Node.js, Shelf";
      case "Mobile":
        return "Flutter";
    }
    return technologies[Random().nextInt(10)];
  }
}
""";

  final controller = ScrollController();
  final markdowncontroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: AppColors.borderGrey)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReadmeHeaderName(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Joao Pedro Rafael",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(
                color: Colors.white,
                height: 25,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              contactRow(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Software Developer",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Image.network(
                "https://raw.githubusercontent.com/JoaoRafa19/joaorafa19.github.io/main/assets/assets/images/pato.gif",
                height: 100,
                width: 100,
              ),
              const Divider(
                thickness: 10,
                color: Colors.white,
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: HighlightView(
                  _code,
                  language: 'dart',
                  tabSize: 8,
                  theme: atomOneDarkReasonableTheme,
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.ac_unit,
                    color: Colors.blue[300],
                  ),
                  Text(
                    "Current Personal Projects:",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ],
              ),
              const Divider(
                thickness: 10,
                color: Colors.white,
                height: 10,
              ),
              const CurrentProjects(projectName: "Backend Go"),
              const CurrentProjects(projectName: "Websockets Api"),
              const CurrentProjects(projectName: "Flutter Frontend"),
              const CurrentProjects(projectName: "React Frontend"),
              const SizedBox(
                height: 20,
              ),
              ask(context),
            ],
          ),
        ),
      ],
    );
  }

  Container ask(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          color: AppColors.borderGrey,
          border: Border.all(color: AppColors.borderGrey)),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.chat,
              size: 12,
              color: AppColors.white,
            ),
          ),
          Text(
            'Ask me about anything, I am happy to help!',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Row contactRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReadmeBadge(
          backgroundColor: Colors.blue[900]!,
          text: "Connect",
          icon: Icons.work_outline,
        ),
        ReadmeBadge(
          backgroundColor: Colors.red[600]!,
          text: "Contact-me!",
          icon: Icons.email_outlined,
        ),
        const ReadmeBadge(
          backgroundColor: Colors.black,
          text: "DEV.to",
          icon: Icons.logo_dev_outlined,
        ),
      ],
    );
  }
}
