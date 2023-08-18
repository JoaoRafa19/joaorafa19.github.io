import 'package:flutter/material.dart';
import 'package:portifolio/utils/style.dart';
import 'package:portifolio/widgets/responsive_widget.dart';
import 'package:url_launcher/link.dart';

class HeaderBadge extends StatelessWidget {
  HeaderBadge({
    super.key,
    required this.name,
    required this.icon,
    this.isActive = false,
    this.onTap,
  });

  final String name;
  final bool? isActive;
  final IconData icon;
  final VoidCallback? onTap;
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: _key,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Link(
          uri: Uri.parse(''),
          builder: (context, FollowLink? follow) {
            return TextButton(
              onPressed: onTap,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                  right: 5,
                  bottom: 5,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            icon,
                            color: Colors.grey[700],
                          ),
                        ),
                        !ResponsiveWidget.isSmallScreen(context)
                            ? Text(
                                name,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
