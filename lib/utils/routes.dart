import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portifolio/src/modules/profile/profile_controller.dart';
import 'package:portifolio/src/modules/profile/profile_page.dart';
import 'package:portifolio/src/repository/repository_factory_impl.dart';
import 'package:portifolio/src/usecases/githubprojects/github_projects_usecase.dart';

import '../src/modules/home/home_page.dart';

appRoutes() => [
      GetPage(
        name: '/home',
        page: () => const HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/',
        page: () => const ProfilePage(),
        middlewares: [MyMiddelware()],
        bindings: [
          BindingsBuilder(() {
            Get.put(GithubProjectsUsecase(RepositoryFactoryImpl()));
            Get.put(ProfileController());
          })
        ],
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    debugPrint(page?.name);
    return super.onPageCalled(page);
  }
}
