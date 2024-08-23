import 'package:coke_platform/common/extension/num_extension.dart';
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
      fontSize: 16.sp,
      height: 1.15.wMax,
      fontWeight: FontWeight.w500,
    );
    final bold = textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
      color: const Color(0xFF403815),
      fontSize: 16.sp,
      height: 1.15.wMax,
    );
    return SizedBox(
      width: 1400.w,
      height: 900.w,
      child: Row(
        children: [
          50.w.wSpace,
          SizedBox(
            width: 525.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.current.aboutTheProgram.toUpperCase(),
                  style: textTheme.displaySmall?.copyWith(
                    color: const Color(0xFF084A99),
                    fontSize: 36.sp,
                  ),
                ),
                16.hSpace,
                SelectableText.rich(
                  TextSpan(
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
                Row(
                  children: [
                    CustomFilledButton(
                      title: S.current.applyNow,
                      onTap: () {
                        context.go('/apply');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
