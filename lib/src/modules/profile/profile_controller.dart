import 'package:get/get.dart';
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

  final RxList<String> _langIcons = RxList<String>([]);

  List<String> get langIcons => _langIcons;

  final projects = [].obs;

  Future getProjects() async {
    final projects = await _githubProjectsUsecase.execute();
    this.projects.value = projects;

    final lastProjects =
        await _githubProjectsUsecase.execute(lastProjectsLimit: 5);

    final langIcons_ = await _langIconsUsecase.execute(lastProjects);
    _langIcons.value = langIcons_;
  }
}
