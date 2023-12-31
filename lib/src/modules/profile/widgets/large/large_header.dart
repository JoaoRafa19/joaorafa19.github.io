import 'package:flutter/material.dart';
import 'package:portifolio/src/modules/profile/widgets/header_border.dart';
import 'package:portifolio/utils/style.dart';

class LargeHeader extends StatelessWidget {
  const LargeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.headerBlack),
      height: 70,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 5, bottom: 12, left: 10, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          children: [
            HeaderBorder(
              margin: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.menu,
                color: Colors.grey[700],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(1),
              child: const FadeInImage(
                placeholder: AssetImage('assets/images/github-mark.png'),
                image: NetworkImage(
                  "https://raw.githubusercontent.com/JoaoRafa19/joaorafa19.github.io/72630cc615fb0e7ab1993e91a0d02b077362b5ed/assets/assets/images/github-mark.svg", // ignore: deprecated_member_use
                ),
              ),
            ),
            const Text(
              "JoaoRafa19",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            HeaderBorder(
              margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
              child: SizedBox(
                height: 50,
                width: 500,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabled: false,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Clone made with Flutter",
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.grey[700],
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 0.5,
                              height: 24,
                              color: Colors.grey[700],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Colors.grey[700],
                            )
                          ]),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 12),
              color: Colors.grey[600],
              height: 50,
              width: 1,
            ),
            HeaderBorder(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    weight: 0.5,
                    color: Colors.grey[700],
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey[700],
                  ),
                ],
              ),
            ),
            HeaderBorder(
              margin: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.code_outlined,
                color: Colors.grey[700],
              ),
            ),
            HeaderBorder(
              margin: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.fork_left_outlined,
                color: Colors.grey[700],
              ),
            ),
            HeaderBorder(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Icon(
                Icons.inbox_outlined,
                color: Colors.grey[700],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const FadeInImage(
                  height: 50,
                  fit: BoxFit.fill,
                  placeholder: AssetImage('assets/images/github-mark.png'),
                  image: NetworkImage(
                    "https://raw.githubusercontent.com/JoaoRafa19/joaorafa19.github.io/72630cc615fb0e7ab1993e91a0d02b077362b5ed/assets/assets/images/github-mark.svg", // ignore: deprecated_member_use
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
