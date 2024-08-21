import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/widget/language.dart';
import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/button/custom.dart';
import 'package:coke_platform/service/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LandingPageAppbar extends StatelessWidget {
  final bool showLogo;
  final bool showLoginBtn;
  final bool showApplyBtn;
  const LandingPageAppbar({
    super.key,
    this.showLogo = false,
    this.showApplyBtn = true,
    this.showLoginBtn = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
        top: 10.w,
      ),
      child: Row(
        children: [
          const Spacer(),
          if (showLogo)
            InkWell(
              onTap: () {
                context.go('/');
              },
              child: Assets.images.logoWhite.image(
                width: 180.w,
              ),
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (showApplyBtn)
                  CustomFilledButton(
                    title: S.current.applyNow,
                    onTap: () {
                      context.go('/apply');
                    },
                  ),
                24.wSpace,
                if (showLoginBtn)
                  CustomTextButton(
                    title: AppDependencies.injector
                            .get<FirebaseAuthService>()
                            .isUserSignedIn()
                        ? S.current.profile
                        : S.current.login,
                    onTap: () {
                      context.go('/login');
                    },
                  ),
                24.wSpace,
                const LanguageSwitch(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
