import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portifolio/src/profile/widgets/badge.dart';
import 'package:portifolio/src/profile/widgets/large/large_header.dart';
import 'package:portifolio/utils/style.dart';

class LargeProfilePage extends StatelessWidget {
  const LargeProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bodyBlack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LargeHeader(),
            _headerBottom(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Column(), // Profile
                      Readme(), // Readme
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _headerBottom() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: AppStyle.headerBlack),
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

class Readme extends StatelessWidget {
  Readme({
    super.key,
  });
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(color: AppStyle.borderGrey)),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReadmeHeaderName(),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Joao Pedro Rafael",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: AppStyle.white,
              ),
            ),
            const Divider(
              color: Colors.white,
              height: 25,
              thickness: 2,
              indent: 5,
              endIndent: 5,
            ),
            contactRow(),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Software Developer",
              style: TextStyle(
                  color: AppStyle.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Image.asset(
              "images/pato.gif",
              height: 100,
              width: 100,
            ),
            Divider(
              thickness: 10,
              color: Colors.white,
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.ac_unit,
                  color: Colors.blue[300],
                ),
                Text(
                  "Current Personal Projects",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppStyle.white,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row contactRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReadmeBadge(
          backgroundColor: Colors.blue[900]!,
          text: "Connect",
          icon: Icons.work_outline,
        ),
        ReadmeBadge(
          backgroundColor: Colors.red[600]!,
          text: "Contact-me!",
          icon: Icons.email_outlined,
        ),
        const ReadmeBadge(
          backgroundColor: Colors.black,
          text: "DEV.to",
          icon: Icons.logo_dev_outlined,
        ),
      ],
    );
  }
}

class ReadmeBadge extends StatelessWidget {
  const ReadmeBadge({
    super.key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
    this.link,
  });

  final IconData icon;
  final String text;
  final String? link;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(2))),
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.all(2),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppStyle.white,
          ),
          Text(
            text,
            style:
                TextStyle(color: AppStyle.white, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class ReadmeHeaderName extends StatelessWidget {
  const ReadmeHeaderName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "JoaoRafa19",
          style: TextStyle(color: AppStyle.white),
        ),
        Text(
          "/",
          style: TextStyle(color: Colors.grey[700]),
        ),
        Text(
          "README",
          style: TextStyle(color: AppStyle.white),
        ),
        Text(
          ".md",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
