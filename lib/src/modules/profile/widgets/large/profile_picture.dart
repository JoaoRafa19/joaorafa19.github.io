import 'package:file_icon/file_icon.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/utils/style.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({
    super.key,
    required this.langIcons,
  });
  final List<String> langIcons;

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  bool isHover = false;
  bool renderVisible = false;

  void hover(event) {
    setState(() {
      isHover = !isHover;
    });
  }

  final List<String> _languageIcons = [];

  @override
  void initState() {
    _languageIcons.addAll(widget.langIcons);

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
