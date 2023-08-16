import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portifolio/src/modules/profile/profile_controller.dart';
import 'package:portifolio/src/modules/profile/widgets/large/large_profile_page.dart';
import 'package:portifolio/src/modules/profile/widgets/medium/medium_profile_page.dart';
import 'package:portifolio/src/modules/profile/widgets/small/small_profile_page.dart';
import 'package:portifolio/widgets/responsive_widget.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      smallScreen: const SmallProfilePage(),
      mediumScreen: const MediumProfilePage(),
      largeScreen: LargeProfilePage(
        langIcons: controller.langIcons,
      ),
    );
  }
}
