import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/button/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final normal = textTheme.bodyLarge?.copyWith(
      color: const Color(0xFF403815),
      fontSize: 14.spMax,
      fontWeight: FontWeight.w500,
    );
    final bold = textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
      color: const Color(0xFF403815),
      fontSize: 14.spMax,
    );
    return SizedBox(
      width: double.infinity,
      height: 900.h,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 60.h,
            left: 90.w,
            child: Assets.images.about.background.image(),
          ),
          Row(
            children: [
              100.w.wSpace,
              SizedBox(
                width: 450.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.current.aboutTheProgram.toUpperCase(),
                      style: textTheme.displaySmall?.copyWith(
                        color: ColorConstants.color3F6DB8,
                        fontSize: 48.spMax,
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
                        ],
                      ),
                    ),
                    Text(
                      S.current.aboutTheProgramContent14,
                      style: bold?.copyWith(
                        color: const Color(0xFF0F4D91),
                      ),
                    ),
                    24.hSpace,
                    CustomFilledButton(
                      title: S.current.applyNow,
                      onTap: () {
                        context.go('/apply');
                      },
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
