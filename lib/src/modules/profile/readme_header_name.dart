import 'package:flutter/material.dart';
import 'package:portifolio/utils/style.dart';

class ReadmeHeaderName extends StatelessWidget {
  const ReadmeHeaderName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "JoaoRafa19",
          style: TextStyle(color: AppColors.white),
        ),
        Text(
          "/",
          style: TextStyle(color: Colors.grey[700]),
        ),
        const Text(
          "README",
          style: TextStyle(color: AppColors.white),
        ),
        Text(
          ".md",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
