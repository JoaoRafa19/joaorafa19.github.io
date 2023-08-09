import 'package:flutter/material.dart';
import 'package:portifolio/utils/style.dart';

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

