import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/widget/language.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/button/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LandingPageAppbar extends StatelessWidget {
  const LandingPageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
      ),
      child: Row(
        children: [
          Assets.images.logoWhite.image(
            width: 160,
          ),
          const Spacer(),
          CustomButton(
            title: S.current.applyNow,
            onTap: () {
              context.go('/apply');
            },
          ),
          24.wSpace,
          const LanguageSwitch(),
        ],
      ),
    );
  }
}
