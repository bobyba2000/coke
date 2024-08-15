import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final normal = textTheme.bodyLarge?.copyWith(
      color: Colors.white,
      fontSize: 16,
    );
    final bold = textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 20,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.current.aboutTheProgram,
          style: textTheme.displaySmall?.copyWith(
            color: ColorConstants.colorFFF220,
            fontSize: 48,
          ),
        ),
        16.hSpace,
        RichText(
          text: TextSpan(
            text: S.current.aboutTheProgramContent1,
            style: normal,
            children: [
              TextSpan(
                text: S.current.aboutTheProgramContent1,
                style: normal,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent2,
                style: bold,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent3,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent4,
                style: bold,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent5,
                style: normal,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent6,
                style: bold,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent7,
                style: normal,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent8,
                style: bold,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent9,
                style: normal,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent10,
                style: bold,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent11,
                style: normal,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent12,
                style: bold,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent13,
                style: normal,
              ),
              TextSpan(
                text: S.current.aboutTheProgramContent14,
                style: bold,
              ),
            ],
          ),
        )
      ],
    );
  }
}
