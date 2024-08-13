import 'dart:math';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/dialog.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/appbar/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'about/widget.dart';
import 'overall/widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    // Future.delayed(
    //   const Duration(milliseconds: 200),
    //   () {
    //     DialogUtility.showLanguagePicker(
    //       context,
    //       title: S.current.languagePickerLandingPage,
    //     );
    //   },
    // );

    super.initState();
  }

  final aboutKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = 1400.w;
    final screenHeight = 900.h;
    return Scaffold(
      backgroundColor: ColorConstants.teal,
      body: Stack(
        children: [
          Expanded(
            child: ScrollTransformView(
              children: [
                ScrollTransformItem(
                  builder: (scrollOffset) {
                    final offScreenPercentage = min(scrollOffset / 900.h, 1.0);
                    final width = screenWidth - (screenWidth * 0.2 * offScreenPercentage);
                    final height = screenHeight - (screenHeight * 0.2 * offScreenPercentage);
                    return Opacity(
                      opacity: 1 - offScreenPercentage,
                      child: LadingOverallWidget(
                        width: width,
                        height: height,
                      ),
                    );
                  },
                  offsetBuilder: (scrollOffset) {
                    final offScreenPercentage = min(scrollOffset / 900.h, 1.0);
                    final heightShrinkAmount = 900.h * 0.2 * offScreenPercentage;
                    final bool startMoving = scrollOffset >= 900.h;
                    final onScreenOffset = scrollOffset + heightShrinkAmount / 3;
                    return Offset(
                      0,
                      !startMoving ? onScreenOffset : (onScreenOffset - (scrollOffset - 900.h * 0.5)),
                    );
                  },
                ),
                ScrollTransformItem(
                  offsetBuilder: (scrollOffset) => Offset(
                    0,
                    -900.h,
                  ),
                  builder: (context) {
                    return SizedBox(
                      width: 1400.w,
                      height: 900.h,
                      child: Column(
                        children: [
                          const LandingPageAppbar(),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Assets.images.cokeFresh.image(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24),
                                        child: Assets.images.fizzUp.image(),
                                      ),
                                      40.h.hSpace,
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Assets.images.model.image(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ScrollTransformItem(
                  builder: (scrollOffset) {
                    final box = aboutKey.currentContext!.findRenderObject() as RenderBox;
                    return Container(
                      color: ColorConstants.colorEA213C,
                      width: 1400.w,
                      height: box.size.height,
                      padding: const EdgeInsets.all(16),
                    );
                  },
                  offsetBuilder: (scrollOffset) {
                    final box = aboutKey.currentContext!.findRenderObject() as RenderBox;
                    return Offset(
                      0,
                      -box.size.height,
                    );
                  },
                ),
                ScrollTransformItem(
                  key: aboutKey,
                  builder: (scrollOffset) {
                    return Container(
                      width: 1400.w,
                      padding: const EdgeInsets.all(16),
                      child: const AboutWidget(),
                    );
                  },
                  offsetBuilder: (scrollOffset) {
                    final box = aboutKey.currentContext!.findRenderObject() as RenderBox;
                    final offScreenPercentage = min(scrollOffset / (box.size.height * 2), 1.0);
                    final dx = min(1400.w * offScreenPercentage * (screenWidth / screenHeight) - 1400.w, 0.0);
                    return Offset(
                      dx,
                      -box.size.height * 2,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
