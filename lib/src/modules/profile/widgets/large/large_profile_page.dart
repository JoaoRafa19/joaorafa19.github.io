// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:file_icon/file_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portifolio/src/modules/profile/profile_controller.dart';
import 'package:portifolio/src/modules/profile/widgets/badge.dart';
import 'package:portifolio/src/modules/profile/widgets/large/large_header.dart';
import 'package:portifolio/src/modules/profile/widgets/large/readme.dart';
import 'package:portifolio/utils/style.dart';

class LargeProfilePage extends StatelessWidget {
  const LargeProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBlack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LargeHeader(),
            _headerBottom(),
            const LargeBody(),
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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 50),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PersonalInformation(),
                Readme(), // Readme
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PersonalInformation extends StatelessWidget {
  PersonalInformation({
    super.key,
  });

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ProfilePicture(),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Joao Pedro Rafael",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "JoaoRafa19",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        // minimumSize: MaterialStateProperty.all(
                        //     const Size(double.infinity, 40)),
                        textStyle: MaterialStateProperty.resolveWith(
                          (states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(color: AppColors.bodyBlack);
                            }
                            return Theme.of(context).textTheme.displayMedium;
                          },
                        ),
                        backgroundColor:
                            MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.hovered)) {
                            return AppColors.lightGrey;
                          }
                          return AppColors.borderGrey;
                        }),
                      ),
                      child: const Text("Follow"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  bool isHover = false;
  bool renderVisible = false;
  final controller = Get.find<ProfileController>();

  void hover(event) {
    setState(() {
      isHover = !isHover;
    });
  }

  final List<String> _languageIcons = [];

  @override
  void initState() {
    _languageIcons.addAll(controller.langIcons);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: hover,
      onExit: hover,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(255),
                border: Border.all(
                    color: AppColors.borderGrey,
                    style: BorderStyle.solid,
                    width: 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(255),
              child: Image.network(
                "https://avatars.githubusercontent.com/u/50741246?v=4",
                height: 350,
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            right: 10,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOut,
              height: 50,
              onEnd: () {
                setState(() {
                  renderVisible = isHover;
                });
              },
              width: isHover ? 160 : 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(255),
                color: AppColors.bodyBlack,
                border: Border.all(
                    color: AppColors.borderGrey,
                    style: BorderStyle.solid,
                    width: 2),
              ),
              child: isHover && renderVisible
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FileIcon("main.dart"),
                        FileIcon("main.go"),
                        FileIcon("main.c"),
                        FileIcon("main.ts"),
                      ],
                    )
                  : const Center(
                      child: Text(
                        "BR",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
