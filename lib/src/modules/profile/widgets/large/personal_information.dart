import 'package:flutter/material.dart';
import 'package:portifolio/src/modules/profile/widgets/large/profile_picture.dart';
import 'package:portifolio/utils/style.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    super.key,
    required this.langIcons,
  });

  final List<String> langIcons;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfilePicture(langIcons: langIcons),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Joao Pedro Rafael",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse("https://github.com/JoaoRafa19"),
                        builder: (context, followLink) {
                          return TextButton(
                            onPressed: () => launchUrl(
                                Uri.parse("https://github.com/JoaoRafa19")),
                            child: Text(
                              "JoaoRafa19",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Mid Level Software Engineer "),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.white,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Belo Horizonte, MG - Brazil",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.email,
                          color: AppColors.white,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse("mailto:joaopedrorafael@gmail.com"),
                            builder: (context, followLink) {
                              return TextButton(
                                onPressed: () => launchUrl(Uri.parse(
                                    "mailto:joaopedrorafael@gmail.com")),
                                child: Text(
                                  "joaopedrorafael@gmail.com",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              );
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.link,
                          color: AppColors.white,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(
                              "https://linkedin.com/in/joaopedrorafael/"),
                          builder: (context, followLink) => TextButton(
                            onPressed: () => launchUrl(Uri.parse(
                                "https://linkedin.com/in/joaopedrorafael/")),
                            child: Text(
                              "linkedin.com/in/joaopedrorafael/",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ],
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
