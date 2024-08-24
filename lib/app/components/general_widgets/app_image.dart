import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.image,
    this.padding,
  });

  final String image;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => Container(
        padding: padding ?? const EdgeInsets.all(10),
        child: Image.asset(image),
      );
}
