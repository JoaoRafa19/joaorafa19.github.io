import 'package:get/get.dart';
import 'package:portifolio/src/usecases/githubprojects/github_projects_usecase.dart';

class ProfileController extends GetxController {
  final GithubProjectsUsecase _githubProjectsUsecase =
      Get.find<GithubProjectsUsecase>();

  ProfileController();

  @override
  void onInit() {
    getProjects();
    super.onInit();
  }

  final projects = [].obs;

  Future getProjects() async {
    var projects = await _githubProjectsUsecase.execute();
    this.projects.value = projects;
  }
}
