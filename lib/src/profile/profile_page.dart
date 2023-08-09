import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portifolio/src/profile/profile_controller.dart';
import 'package:portifolio/src/profile/widgets/large/large_profile_page.dart';
import 'package:portifolio/src/profile/widgets/medium/medium_profile_page.dart';
import 'package:portifolio/src/profile/widgets/small/small_profile_page.dart';
import 'package:portifolio/widgets/responsive_widget.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      smallScreen: SmallProfilePage(),
      mediumScreen: MediumProfilePage(),
      largeScreen: LargeProfilePage(),
    );
  }
}

