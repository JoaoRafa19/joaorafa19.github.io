import 'package:get/get.dart';
import 'package:portifolio/src/models/github_project_model.dart';
import 'package:portifolio/src/usecases/githubprojects/github_projects_usecase.dart';
import 'package:portifolio/src/usecases/lang_icons/lang_icons_usecase.dart';

class ProfileController extends GetxController {
  final GithubProjectsUsecase _githubProjectsUsecase =
      Get.find<GithubProjectsUsecase>();

  final LangIconsUsecase _langIconsUsecase = Get.find<LangIconsUsecase>();

  ProfileController();

  @override
  void onInit() {
    getProjects();
    super.onInit();
  }

  final RxList<String> langIcons = RxList<String>([]);

  final RxList<Project> projects = RxList<Project>([]);

  Future<void> getProjects() async {
    final projects = await _githubProjectsUsecase.execute()
      ..sort((a, b) =>
          // int comparacao = (a.description ?? '').compareTo((b.description ?? ''));
          // if (comparacao != 0) {
          //   return -comparacao;
          // }
          // return -a.updatedAt.compareTo(b.updatedAt);
          -a.id.compareTo(b.id));
    this.projects.value = projects;

    final lastProjects =
        await _githubProjectsUsecase.execute(lastProjectsLimit: 5);

    final langIcons_ = await _langIconsUsecase.execute(projects);
    langIcons.value = langIcons_;
  }
}
