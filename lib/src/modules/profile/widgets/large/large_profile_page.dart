import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portifolio/src/models/github_project_model.dart';
import 'package:portifolio/src/modules/profile/widgets/badge.dart';
import 'package:portifolio/src/modules/profile/widgets/large/large_header.dart';
import 'package:portifolio/src/modules/profile/widgets/large/personal_information.dart';
import 'package:portifolio/src/modules/profile/widgets/large/readme.dart';
import 'package:portifolio/utils/style.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class LargeProfilePage extends StatelessWidget {
  LargeProfilePage(
      {super.key, required this.langIcons, required this.projects});
  final List<String> langIcons;
  final List<Project> projects;
  final ScrollController _scrollController = ScrollController();
  final overview = GlobalKey();
  final repository = GlobalKey();
  final project = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBlack,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const LargeHeader(),
            _headerBottom(),
            LargeBody(
              overviewKey: overview,
              repositoryKey: repository,
              projectKey: project,
              langIcons: langIcons,
              projects: projects,
            ),
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
            onTap: () {
              Scrollable.ensureVisible(overview.currentContext!,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            },
            isActive: true,
          ),
          HeaderBadge(
            icon: Icons.book_outlined,
            name: "Repository",
            onTap: () {
              Scrollable.ensureVisible(project.currentContext!,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            },
          ),
          HeaderBadge(
            icon: Icons.code_sharp,
            name: "Projects",
            onTap: () {
              Scrollable.ensureVisible(project.currentContext!,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            },
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
  const LargeBody(
      {super.key,
      required this.langIcons,
      required this.projects,
      required this.overviewKey,
      required this.repositoryKey,
      required this.projectKey});
  final List<String> langIcons;
  final List<Project> projects;
  final Key overviewKey;
  final Key repositoryKey;
  final Key projectKey;

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Readme(
                      key: overviewKey,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Pinned",
                      key: projectKey,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                        onVerticalDragUpdate: (_) {},
                        child: PinnedProjects(
                            key: repositoryKey, projects: projects))
                  ],
                ), // Readme
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PinnedProjects extends StatelessWidget {
  const PinnedProjects({
    super.key,
    required this.projects,
  });

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.5,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => launchUrl(Uri.parse(projects[index].url)),
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.borderGrey,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.book_outlined,
                            color: AppColors.lightGrey,
                          ),
                          const SizedBox(width: 5),
                          Link(
                              uri: Uri.parse(projects[index].url),
                              builder: (BuildContext context,
                                      FollowLink? followLink) =>
                                  TextButton(
                                    onPressed: () => launchUrl(
                                        Uri.parse(projects[index].url)),
                                    child: Text(
                                      projects[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      textWidthBasis: TextWidthBasis.parent,
                                      strutStyle: const StrutStyle(
                                        fontSize: 12,
                                        height: 1.5,
                                      ),
                                    ),
                                  )),
                          const SizedBox(width: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.borderGrey,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              "Public",
                              style: AppTheme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      projects[index].description ?? "",
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container()),
                    projects[index].language.isNotEmpty
                        ? Row(
                            children: [
                              SvgPicture.network(
                                "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/${projects[index].language.toLowerCase()}/${projects[index].language.toLowerCase()}-original.svg", // ignore: deprecated_member_use
                                height: 24,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.contain,

                                placeholderBuilder: (context) =>
                                    const CircularProgressIndicator(),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                projects[index].language,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
