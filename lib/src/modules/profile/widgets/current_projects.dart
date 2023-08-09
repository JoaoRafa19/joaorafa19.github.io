
import 'package:flutter/material.dart';
import 'package:portifolio/utils/style.dart';

class CurrentProjects extends StatelessWidget {
  const CurrentProjects({
    Key? key,
    required this.projectName,
  }) : super(key: key);

  final String projectName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0, left: 16),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5,
        runAlignment: WrapAlignment.center,
        children: [
          CircleAvatar(
            radius: 5,
            foregroundColor: AppStyle.headerBlack,
            backgroundColor: AppStyle.headerBlack,
          ),
          Text(
            projectName,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

