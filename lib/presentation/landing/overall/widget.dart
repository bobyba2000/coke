import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LadingOverallWidget extends StatefulWidget {
  const LadingOverallWidget({super.key});

  @override
  State<LadingOverallWidget> createState() => _LadingOverallWidgetState();
}

class _LadingOverallWidgetState extends State<LadingOverallWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          color: colorScheme.primary,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    120.h.hSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
        Assets.images.landingPage1.image(
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
