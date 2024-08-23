import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/dialog.dart';
import 'package:coke_platform/common/utility/share_preference.dart';
import 'package:coke_platform/common/widget/language.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/application/form/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          if (!value) {
            DialogUtility.showLanguagePicker(
              context,
              title: S.current.languagePickerApplyPage,
            ).then(
              (value) => SharePreferenceUtitlity.markShowLanguagePopup(),
            );
          }
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        )
                      ],
                    ),
                    45.hSpace,
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
