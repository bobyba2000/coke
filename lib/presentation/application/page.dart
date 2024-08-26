import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/dialog.dart';
import 'package:coke_platform/common/utility/share_preference.dart';
import 'package:coke_platform/common/widget/language.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/application/form/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        SharePreferenceUtitlity.checkIsShowLanguagePopup().then((value) {
          if (value == null ||
              (value.isBefore(
                DateTime.now().subtract(
                  const Duration(
                    minutes: 5,
                  ),
                ),
              ))) {
            DialogUtility.showLanguagePicker(
              context,
              title: S.current.languagePickerApplyPage,
            ).then(
              (value) => SharePreferenceUtitlity.markShowLanguagePopup(DateTime.now()),
            );
          }
        });
      },
    ).then((value) {
      if (1400.w < 500) {
        DialogUtility.showWarningDialog(
          context,
          title: S.current.mobileWarning,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = 1400.w < 500;
    return Title(
      color: Colors.white,
      title: 'Apply Now',
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Assets.images.header.image(
                          width: 1400.w,
                          fit: BoxFit.fitWidth,
                        ),
                        Positioned(
                          right: 40.w,
                          top: 10.w,
                          child: const LanguageSwitch(),
                        ),
                        Positioned(
                          top: isMobile ? 10 : 10.w,
                          left: (1400.w - (isMobile ? 60 : 240)) / 2,
                          child: InkWell(
                            onTap: () {
                              context.go('/');
                            },
                            child: Assets.images.logoWhite.image(
                              width: isMobile ? 60 : 240,
                            ),
                          ),
                        ),
                      ],
                    ),
                    36.hSpace,
                    Text(
                      S.current.applicationForm.toUpperCase(),
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: ColorConstants.teal,
                          ),
                    ),
                    24.hSpace,
                    const ApplyFormWidget(),
                    64.hMax.hSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
