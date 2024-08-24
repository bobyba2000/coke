import 'dart:math';

import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/presentation/landing/mobile/about/widget.dart';
import 'package:coke_platform/presentation/landing/mobile/countdown/widget.dart';
import 'package:coke_platform/presentation/landing/mobile/essence/widget.dart';
import 'package:coke_platform/presentation/landing/mobile/journey/widget.dart';
import 'package:coke_platform/presentation/landing/mobile/progress/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'career/widget.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
                  Stack(
                    children: [
                      Transform.rotate(
                        angle: -pi,
                        child: Assets.images.essence.bottom.image(),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          color: const Color(0xFF3f6db8),
                          height: 5,
                          width: 1400.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            EssenceWidget(
              key: essenceKey,
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
