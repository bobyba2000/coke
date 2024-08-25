
import 'package:coke_platform/common/utility/dialog.dart';
import 'package:coke_platform/common/utility/share_preference.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/mobile/about/widget.dart';
import 'package:coke_platform/presentation/landing/mobile/countdown/widget.dart';
import 'package:coke_platform/presentation/landing/mobile/essence/widget.dart';
import 'package:coke_platform/presentation/landing/mobile/journey/widget.dart';
import 'package:coke_platform/presentation/landing/mobile/progress/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appbar/widget.dart';
import 'career/widget.dart';
import 'drawer/widget.dart';

class MobileLandingPage extends StatefulWidget {
  const MobileLandingPage({super.key});

  @override
  State<MobileLandingPage> createState() => _MobileLandingPageState();
}

class _MobileLandingPageState extends State<MobileLandingPage> {
  final ScrollController _background = ScrollController();
  final overviewKey = GlobalKey();
  final aboutKey = GlobalKey();
  final essenceKey = GlobalKey();
  final careerKey = GlobalKey();
  final journalKey = GlobalKey();
  final progressKey = GlobalKey();

  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        SharePreferenceUtitlity.checkIsShowLanguagePopup().then((value) {
          if (!value) {
            DialogUtility.showLanguagePicker(
              context,
              title: S.current.languagePickerLandingPage,
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
    return Scaffold(
      appBar: const MobileAppbar(),
      drawer: MobileDrawer(
        controller: _background,
        overview: overviewKey,
        about: aboutKey,
        essence: essenceKey,
        career: careerKey,
        journey: journalKey,
        progress: progressKey,
      ),
      body: SingleChildScrollView(
        controller: _background,
        child: Column(
          children: [
            Container(
              color: ColorConstants.teal,
              width: 1400.w,
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.overview.mobile.image(
                    key: overviewKey,
                    width: 1400.w,
                    fit: BoxFit.fitWidth,
                  ),
                  MobileAboutWidget(
                    key: aboutKey,
                  ),
                ],
              ),
            ),
            Container(
              color: ColorConstants.teal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Assets.images.about.bottom.image(width: 1400.w),
                      ),
                      Assets.images.about.model.image(width: 1400.w),
                    ],
                  ),
                  Stack(
                    children: [
                      EssenceWidget(
                        key: essenceKey,
                      ),
                      Positioned(
                        child: Container(
                          color: const Color(0xFF3f6db8),
                          width: 1400.w,
                          height: 6,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            MobileCareerWidget(
              key: careerKey,
            ),
            MobileJourneyWidget(
              key: journalKey,
            ),
            MobileProgressWidget(
              key: progressKey,
            ),
            MobileCountdownWidget(
              controller: _background,
              overview: overviewKey,
              about: aboutKey,
              essence: essenceKey,
              career: careerKey,
              journey: journalKey,
              progress: progressKey,
            ),
          ],
        ),
      ),
    );
  }
}
