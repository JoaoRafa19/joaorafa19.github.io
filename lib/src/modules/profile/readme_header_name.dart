import 'package:flutter/material.dart';
import 'package:portifolio/utils/style.dart';

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
