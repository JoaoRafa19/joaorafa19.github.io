import 'package:flutter/material.dart';

class HeaderBorder extends StatelessWidget {
  const HeaderBorder(
      {super.key, required this.child, this.margin, this.padding});
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(5),
      margin: margin ?? const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Colors.grey[700] ?? Colors.grey, width: 0.5),
        shape: BoxShape.rectangle,
      ),
      child: child,
    );
  }
}
