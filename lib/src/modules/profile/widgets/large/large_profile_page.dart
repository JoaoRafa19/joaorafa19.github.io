// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portifolio/src/modules/profile/widgets/badge.dart';
import 'package:portifolio/src/modules/profile/widgets/large/large_header.dart';
import 'package:portifolio/src/modules/profile/widgets/large/personal_information.dart';
import 'package:portifolio/src/modules/profile/widgets/large/readme.dart';
import 'package:portifolio/utils/style.dart';

class LargeProfilePage extends StatelessWidget {
  const LargeProfilePage({super.key, required this.langIcons});
  final List<String> langIcons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBlack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LargeHeader(),
            _headerBottom(),
            LargeBody(langIcons: langIcons),
          ],
        ),
      ),
    );
  }

  Container _headerBottom() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(color: AppColors.headerBlack),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeaderBadge(
            icon: Icons.menu_book_outlined,
            name: "Overview",
            isActive: true,
          ),
          HeaderBadge(
            icon: Icons.book_outlined,
            name: "Repository",
          ),
          HeaderBadge(
            icon: Icons.code_sharp,
            name: "Projects",
          ),
          HeaderBadge(
            icon: Icons.folder_outlined,
            name: "Packages",
          ),
          HeaderBadge(
            icon: Icons.star_outline,
            name: "Stars",
          ),
        ],
      ),
    );
  }
}

class LargeBody extends StatelessWidget {
  const LargeBody({
    super.key,
    required this.langIcons,
  });
  final List<String> langIcons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 50),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PersonalInformation(langIcons: langIcons),
                Readme(), // Readme
              ],
            ),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
