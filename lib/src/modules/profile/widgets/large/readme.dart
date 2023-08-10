import 'package:flutter/material.dart';
import 'package:portifolio/src/modules/profile/readme_header_name.dart';
import 'package:portifolio/src/modules/profile/widgets/current_projects.dart';
import 'package:portifolio/src/modules/profile/widgets/large/readme_badge.dart';
import 'package:portifolio/utils/style.dart';

class Readme extends StatelessWidget {
  Readme({
    super.key,
  });
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: AppColors.borderGrey)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReadmeHeaderName(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Joao Pedro Rafael",
                style: Theme.of(context).textTheme.titleLarge,
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
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Image.asset(
                "images/pato.gif",
                height: 100,
                width: 100,
              ),
              const Divider(
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
                    "Current Personal Projects:",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ],
              ),
              const Divider(
                thickness: 10,
                color: Colors.white,
                height: 10,
              ),
              const CurrentProjects(projectName: "Backend Go"),
              const CurrentProjects(projectName: "Websockets Api"),
              const CurrentProjects(projectName: "Flutter Frontend"),
              const CurrentProjects(projectName: "React Frontend"),
              const SizedBox(
                height: 20,
              ),
              Ask(context),
            ],
          ),
        ),
      ],
    );
  }

  Container Ask(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          color: AppColors.borderGrey,
          border: Border.all(color: AppColors.borderGrey)),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.chat,
              size: 12,
              color: AppColors.white,
            ),
          ),
          Text(
            'Ask me about anything, I am happy to help!',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
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
