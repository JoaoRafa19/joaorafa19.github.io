import 'package:get/get.dart';
import 'package:portifolio/src/modules/profile/profile_controller.dart';
import 'package:portifolio/src/repository/repository_factory_impl.dart';
import 'package:portifolio/src/usecases/githubprojects/github_projects_usecase.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GithubProjectsUsecase(RepositoryFactoryImpl()));
    Get.lazyPut(() => ProfileController());
  }


}
