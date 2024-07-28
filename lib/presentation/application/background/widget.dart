import 'package:coke_platform/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Assets.images.background.image(
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
